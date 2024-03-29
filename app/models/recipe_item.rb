# == Schema Information
#
# Table name: recipe_items
#
#  id         :bigint           not null, primary key
#  receipt_id :bigint           not null
#  quantity   :float
#  recipe_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class RecipeItem < ApplicationRecord
  belongs_to :receipt
  belongs_to :recipe

  delegate :name, to: :receipt
  delegate :quantity_scale, to: :receipt

  validates :quantity, presence: true

  def cost
    receipt.cost_per_measurement * quantity
  end
end
