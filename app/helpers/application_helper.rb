module ApplicationHelper
  def quantity_scale_options
    ['ml', 'grams']
  end

  def options_for_inventory_item_and_kitchen_item
    InventoryItem.includes(:kitchen_item).map do |inventory_item|
      ["#{inventory_item.kitchen_item.name}, priced at #{inventory_item.cost_per_item} per item", inventory_item.id]
    end
  end
end
