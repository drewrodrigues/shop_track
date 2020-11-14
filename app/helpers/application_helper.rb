module ApplicationHelper
  def quantity_scale_options
    ['ml', 'grams']
  end

  def options_for_receipt_and_kitchen_item
    Recipe.includes(:kitchen_item).map do |receipt|
      ["#{recipe.kitchen_item.name}, priced at #{receipt.cost_per_item} per item", receipt.id]
    end
  end
end
