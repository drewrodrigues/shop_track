class RecipeItem < ApplicationRecord
  belongs_to :inventory_item
  belongs_to :recipe

  def cost
    inventory_item.cost_per_measurement * quantity
  end
end
