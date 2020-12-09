# == Schema Information
#
# Table name: recipe_combined_items
#
#  id          :bigint           not null, primary key
#  recipe_id   :bigint           not null
#  combined_id :bigint           not null
#  quantity    :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class RecipeCombinedItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :combined

  has_many :combined_items, through: :combined

  delegate :name, to: :combined
  delegate :quantity_scale, to: :combined

  def cost
    combined.cost_per_quantity * quantity
  end

  def items_with_costs(recursive_items = nil, recursive_item_quantity = nil)
    items = []
    (recursive_items || combined_items).each do |item|
      if item.itemable_type == 'Combined'
        items = items + items_with_costs(item.itemable.combined_items, item.quantity)
      else
        needed_quantity_ratio = (recursive_item_quantity || quantity) / combined.quantity
        used_quantity = item.quantity * needed_quantity_ratio
        item_cost = used_quantity * item.cost_per_measurement
        items << {name: item.name, quantity: used_quantity.round(2), cost: item_cost.round(2)}
      end
    end
    items
  end
end
