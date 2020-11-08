require 'test_helper'

class RecipeItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_item = recipe_items(:one)
  end

  test "should get index" do
    get recipe_items_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_item_url
    assert_response :success
  end

  test "should create recipe_item" do
    assert_difference('RecipeItem.count') do
      post recipe_items_url, params: { recipe_item: { inventory_item_id: @recipe_item.inventory_item_id, quantity: @recipe_item.quantity, quantity_scale: @recipe_item.quantity_scale } }
    end

    assert_redirected_to recipe_item_url(RecipeItem.last)
  end

  test "should show recipe_item" do
    get recipe_item_url(@recipe_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_item_url(@recipe_item)
    assert_response :success
  end

  test "should update recipe_item" do
    patch recipe_item_url(@recipe_item), params: { recipe_item: { inventory_item_id: @recipe_item.inventory_item_id, quantity: @recipe_item.quantity, quantity_scale: @recipe_item.quantity_scale } }
    assert_redirected_to recipe_item_url(@recipe_item)
  end

  test "should destroy recipe_item" do
    assert_difference('RecipeItem.count', -1) do
      delete recipe_item_url(@recipe_item)
    end

    assert_redirected_to recipe_items_url
  end
end
