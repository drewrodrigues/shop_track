class Recipe < ApplicationRecord
  has_one_attached :photo
  has_many :recipe_items
end
