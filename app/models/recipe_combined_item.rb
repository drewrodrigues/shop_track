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

  delegate :name, to: :combined
  delegate :quantity_scale, to: :combined

  def cost
    combined.cost_per_quantity * quantity
  end
end
