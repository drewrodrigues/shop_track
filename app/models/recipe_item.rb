class RecipeItem < ApplicationRecord
  belongs_to :receipt
  belongs_to :recipe

  def cost
    receipt.cost_per_measurement * quantity
  end
end
