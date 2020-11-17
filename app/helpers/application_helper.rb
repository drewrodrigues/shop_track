module ApplicationHelper
  def quantity_scale_options
    ['ml', 'grams']
  end

  def options_for_receipt_and_kitchen_item
    Receipt.includes(:kitchen_item).map do |receipt|
      ["#{receipt.kitchen_item.name}, priced at #{receipt.cost_per_item} per item", receipt.id]
    end
  end

  def edit_path_for_nested_resource(parent, child)
    "/#{parent.class.table_name}/#{parent.id}/#{child.class.table_name}/#{child.id}/edit"
  end
end
