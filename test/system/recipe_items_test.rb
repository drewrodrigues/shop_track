require "application_system_test_case"

class RecipeItemsTest < ApplicationSystemTestCase
  setup do
    @recipe_item = recipe_items(:one)
  end

  test "visiting the index" do
    visit recipe_items_url
    assert_selector "h1", text: "Recipe Items"
  end

  test "creating a Recipe item" do
    visit recipe_items_url
    click_on "New Recipe Item"

    fill_in "Inventory item", with: @recipe_item.inventory_item_id
    fill_in "Quantity", with: @recipe_item.quantity
    fill_in "Quantity scale", with: @recipe_item.quantity_scale
    click_on "Create Recipe item"

    assert_text "Recipe item was successfully created"
    click_on "Back"
  end

  test "updating a Recipe item" do
    visit recipe_items_url
    click_on "Edit", match: :first

    fill_in "Inventory item", with: @recipe_item.inventory_item_id
    fill_in "Quantity", with: @recipe_item.quantity
    fill_in "Quantity scale", with: @recipe_item.quantity_scale
    click_on "Update Recipe item"

    assert_text "Recipe item was successfully updated"
    click_on "Back"
  end

  test "destroying a Recipe item" do
    visit recipe_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recipe item was successfully destroyed"
  end
end
