require "selenium-webdriver"

require_relative '../config/environment'
require_relative './product_parser'

class Scraper
  attr_reader :logger

  def initialize
    @logger = Logger.new('scraper.log', 'daily')
    logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime}: #{msg}\n"
    end
    logger.info "Started scraper"

    arguments = %w[--headless --window-size=1920,1080 --disable-dev-shm-usage]
    @driver = Selenium::WebDriver.for(:chrome)
    already_created_checks = Sale.pluck(:pos_fiscal_number)
    login
    go_to_checks
    show_100_results

    loop do
      iterate_over_checks(already_created_checks) do |check|
        create_sale_and_items_from(check)
      end
      go_to_next_page
    end
  rescue Selenium::WebDriver::Error::ElementNotInteractableError => e
    puts e
    driver.save_screenshot("tmp/failure to interact.png")
    logger.error e
    raise e
  end

  private

  attr_accessor :driver

  def go_to_checks
    check_archive = driver.find_elements(class: 'SideBarMenu_MenuItem')[6]
    check_archive.click
    sleep(10)
  end

  def login
    driver.navigate.to "https://my.checkbox.in.ua/"

    email_field = driver.find_element(id: 'input-26')
    email_field.send_keys "g.sophie11@gmail.com"

    password_field = driver.find_element(id: "input-32")
    password_field.send_keys "BobaBlack88"

    submit_button = driver.find_element(class: 'e-button-main--primary')
    submit_button.click
    sleep(10)
  end

  def iterate_over_checks(already_saved_checks)
    concurrent_already_saved_checks_count = 0
    exit if concurrent_already_saved_checks_count > 5

    check_rows = driver.find_elements(class: 't-orm-item')
    check_rows.each_with_index do |row, i|
      cells = row.find_elements(tag_name: 'td')
      _type, datetime, fiscal_number, total = cells.map(&:text)
      if already_saved_checks.include?(fiscal_number) || _type === 'Службова видача'
        logger.info ">> Skipping, already saved: #{fiscal_number} - #{_type}"
        concurrent_already_saved_checks_count += 1
        next
      end
      scroll_to_row(i)

      logger.info "Clicking receipt row button"
      row.find_element(tag_name: 'button').click
      sleep(1)
      logger.info "Opening and clicking context menu"
      click_open_modal_context_menu
      logger.info "Getting product rows from modal"
      product_rows = product_rows_from_modal
      unless product_rows
        logger.info "Didn't find product rows..."
        driver.save_screenshot("tmp/#{fiscal_number}.png")
        close_modal
        next
      end

      begin
        logger.info "Parsing product rows"
        parsed_products = ProductParser.parse(product_rows)
      rescue => e
        logger.info "Error: failed to parse"
        logger.info e
        driver.save_screenshot("tmp/#{fiscal_number}.png")
        close_modal
        next
      end
      logger.info "Closing modal"
      close_modal
      yield datetime: datetime, fiscal_number: fiscal_number, total: total.to_f, items: parsed_products
    end
  end

  def click_open_modal_context_menu
    driver.find_element(class: 'menuable__content__active').click
    sleep(2)
  end

  def product_rows_from_modal
    products_rows = driver.find_element(css: '.v-dialog').text.split("\n")

    logger.info "---products_rows---"
    logger.info products_rows
    logger.info "\n"

    left_constraint = nil
    right_constraint = nil

    can_find_products = products_rows.count { |r| r.include?('*') } == 2

    while (!left_constraint && !right_constraint) && can_find_products
      logger.info "Left constraint: #{left_constraint}"
      logger.info "Right constraint: #{right_constraint}"
      products_rows.each_with_index do |row, i|
        logger.info "Row: #{row}"
        if row.include?('*')
          if !left_constraint
            left_constraint = i + 1
          elsif !right_constraint
            right_constraint = i
          end
        end
      end
    end

    products_rows = (left_constraint && right_constraint) ? products_rows[left_constraint...right_constraint] : nil

    # checkbox_is_trash = products_rows&.any? {|p| p[/^\w+ .* [0-9]+\.[0-9]+ [0-9]+\.[0-9]+$/]}
    # parsed_products = []
    # if checkbox_is_trash
    #   byebug
    #   logger.info "Checkbox is trash, joining multiple lines"
    #   until products_rows.empty?
    #     logger.info "-- line"
    #     parsed_products << products_rows.shift(2).join(' ')
    #   end
    # else
    #   parsed_products = products_rows
    # end

    logger.info "---parsed_products---"
    logger.info products_rows
    logger.info "\n\n\n\n"
    (products_rows.nil? || products_rows.empty?) ? nil : products_rows
  end

  def close_modal
    driver.find_element(class: 't-dialog__close-btn').click
  end

  def create_sale_and_items_from(check)
    ActiveRecord::Base.transaction do
      sale = Sale.new(
        pos_datetime: check[:datetime],
        pos_fiscal_number: check[:fiscal_number],
        pos_total: check[:total]
      )

      check_item_total = 0
      check[:items].each { |item| check_item_total += item[:total_cost] }

      if check_item_total != check[:total]
        logger.info "Oh no, sums don't match up"
        driver.save_screenshot("tmp/#{check[:fiscal_number]}.png")
        raise ActiveRecord::Rollback, "Sums don't match up w/ check_items: #{check_item_total} -- check total: #{check[:total]}"
        next
      end

      sale.save!
      logger.info "Created 1 sale"

      count = 0

      check[:items].each do |item|
        sale_item = SaleItem.new(
          name: item[:name],
          discount: item[:discount],
          quantity: item[:quantity],
          pos_sum: item[:total_cost],
          sale_id: sale.id
        )
        sale_item.save!
        count += 1
      end

      logger.info "Created #{count} associated sale_items"
    end
  end

  def show_100_results
    driver.find_elements(css: '.v-input__slot')[5].click
    sleep(5)
    driver.find_elements(css: '.v-list-item')[20].click
    sleep(5)
  end

  def scroll_to_row(number)
    driver.execute_script("
      let gotoY = document.querySelectorAll('.t-orm-item')[#{number}].offsetTop;
      window.scrollTo(0, gotoY);
    ")
    sleep(5)
  end

  def go_to_next_page
    buttons = driver.find_elements(css: '.v-size--default')
    buttons[buttons.length - 1].click
    sleep(5)
  end
end

Scraper.new
