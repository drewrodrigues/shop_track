require 'test_helper'

class KitchenItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kitchen_item = kitchen_items(:one)
  end

  test "should get index" do
    get kitchen_items_url
    assert_response :success
  end

  test "should get new" do
    get new_kitchen_item_url
    assert_response :success
  end

  test "should create kitchen_item" do
    assert_difference('KitchenItem.count') do
      post kitchen_items_url, params: { kitchen_item: { name: @kitchen_item.name } }
    end

    assert_redirected_to kitchen_item_url(KitchenItem.last)
  end

  test "should show kitchen_item" do
    get kitchen_item_url(@kitchen_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_kitchen_item_url(@kitchen_item)
    assert_response :success
  end

  test "should update kitchen_item" do
    patch kitchen_item_url(@kitchen_item), params: { kitchen_item: { name: @kitchen_item.name } }
    assert_redirected_to kitchen_item_url(@kitchen_item)
  end

  test "should destroy kitchen_item" do
    assert_difference('KitchenItem.count', -1) do
      delete kitchen_item_url(@kitchen_item)
    end

    assert_redirected_to kitchen_items_url
  end
end
