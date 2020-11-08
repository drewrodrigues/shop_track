class RecipeItem < ApplicationRecord
  belongs_to :inventory_item
  belongs_to :recipe
end
