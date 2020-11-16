# == Schema Information
#
# Table name: recipe_processed_items
#
#  id                :bigint           not null, primary key
#  recipe_id         :bigint           not null
#  processed_item_id :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  quantity          :float
#
class RecipeProcessedItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :processed_item

  validates :quantity, presence: true

  delegate :name, to: :processed_item

  def cost
    processed_item.cost_per_one_conversion_quantity * quantity
  end

  def quantity_scale
    processed_item.converts_to_scale
  end
end
