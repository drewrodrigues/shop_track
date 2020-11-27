require "selenium-webdriver"
require 'byebug'

require_relative './product_parser'

class Scraper
  def initialize
    @driver = Selenium::WebDriver.for :chrome
    login
    go_to_checks
    iterate_over_checks do |check|
      puts check
    end
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

  def iterate_over_checks
    check_rows = driver.find_elements(class: 't-orm-item')
    check_rows.each do |row|
      cells = row.find_elements(tag_name: 'td')
      _type, datetime, fiscal_number, sum = cells.map(&:text)
      row.find_element(tag_name: 'button').click
      sleep(5)
      click_open_modal_context_menu
      parsed_products = ProductParser.parse(product_rows_from_modal)
      close_modal
      yield datetime: datetime, fiscal_number: fiscal_number, sum: sum, items: parsed_products
    end
  end

  def click_open_modal_context_menu
    driver.find_element(class: 'menuable__content__active').click
    sleep(5)
  end

  def product_rows_from_modal
    table_rows = driver.find_elements(css: '.v-dialog tr')[13]
    table_rows.find_elements(tag_name: 'tr')
  end

  def close_modal
    driver.find_element(class: 't-dialog__close-btn').click
  end
end

Scraper.new
