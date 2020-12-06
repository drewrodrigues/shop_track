require "selenium-webdriver"

require_relative '../config/environment'
require_relative './product_parser'

class Scraper
  def initialize
    arguments = %w[--headless --window-size=1920,1080 --disable-dev-shm-usage]
    @driver = Selenium::WebDriver.for(:chrome, args: arguments)
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
    check_rows = driver.find_elements(class: 't-orm-item')
    check_rows.each_with_index do |row, i|
      cells = row.find_elements(tag_name: 'td')
      _type, datetime, fiscal_number, total = cells.map(&:text)
      if already_saved_checks.include?(fiscal_number)
        puts ">> Skipping, already saved"
        next
      end
      scroll_to_row(i)

      row.find_element(tag_name: 'button').click
      sleep(1)
      click_open_modal_context_menu
      product_rows = product_rows_from_modal
      unless product_rows
        puts "Didn't find product rows..."
        driver.save_screenshot("tmp/#{fiscal_number}.png")
        close_modal
        next
      end

      begin
        parsed_products = ProductParser.parse(product_rows_from_modal)
      rescue => e
        puts "Error: failed to parse"
        puts e
        driver.save_screenshot("tmp/#{fiscal_number}.png")
        close_modal
        next
      end
      close_modal
      yield datetime: datetime, fiscal_number: fiscal_number, total: total.to_f, items: parsed_products
    end
  end

  def click_open_modal_context_menu
    driver.find_element(class: 'menuable__content__active').click
    sleep(5)
  end

  def product_rows_from_modal
    products_rows = driver.find_element(css: '.v-dialog').text.split("\n")
    products = products_rows.select {|p| p[/^\w+. /]}
    (products.nil? || products.empty?) ? nil : products
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
        puts "Oh no, sums don't match up"
        driver.save_screenshot("tmp/#{check[:fiscal_number]}.png")
        raise ActiveRecord::Rollback, "Sums don't match up w/ check_items: #{check_item_total} -- check total: #{check[:total]}"
        next
      end

      sale.save!
      puts "Created 1 sale"

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

      puts "Created #{count} associated sale_items"
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
