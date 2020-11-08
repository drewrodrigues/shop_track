require "application_system_test_case"

class KitchenItemsTest < ApplicationSystemTestCase
  setup do
    @kitchen_item = kitchen_items(:one)
  end

  test "visiting the index" do
    visit kitchen_items_url
    assert_selector "h1", text: "Kitchen Items"
  end

  test "creating a Kitchen item" do
    visit kitchen_items_url
    click_on "New Kitchen Item"

    fill_in "Name", with: @kitchen_item.name
    click_on "Create Kitchen item"

    assert_text "Kitchen item was successfully created"
    click_on "Back"
  end

  test "updating a Kitchen item" do
    visit kitchen_items_url
    click_on "Edit", match: :first

    fill_in "Name", with: @kitchen_item.name
    click_on "Update Kitchen item"

    assert_text "Kitchen item was successfully updated"
    click_on "Back"
  end

  test "destroying a Kitchen item" do
    visit kitchen_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kitchen item was successfully destroyed"
  end
end
