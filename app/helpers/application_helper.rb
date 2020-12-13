module ApplicationHelper
  def quantity_scale_options
    ['ml', 'gram', 'piece']
  end

  def options_for_receipt_and_kitchen_item
    Receipt.includes(:kitchen_item).all.map do |receipt|
      ["#{receipt.kitchen_item.name}, priced at #{receipt.cost_per_item} per item", receipt.id]
    end
  end

  def options_for_combined_itemable
    Combined.all.map do |combined|
      ["#{combined.name} @ #{combined.cost_per_quantity}", combined.id]
    end
  end

  def edit_path_for_nested_resource(parent, child)
    "/#{parent.class.table_name}/#{parent.id}/#{child.class.table_name}/#{child.id}/edit"
  end

  def good_or_bad_stat(this_stat, comparison_stat)
    if this_stat > comparison_stat
      content_tag :i, "", class: "arrow circle up icon good"
    elsif this_stat < comparison_stat
      content_tag :i, "", class: "arrow circle down icon bad"
    end
  end
end
