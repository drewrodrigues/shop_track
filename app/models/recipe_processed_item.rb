class RecipeProcessedItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :processed_item
end
