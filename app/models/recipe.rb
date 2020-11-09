class Recipe < ApplicationRecord
  has_one_attached :photo
  has_many :recipe_items

  validates :cost, presence: true

  def total_cost
    total = 0
    recipe_items.each {|item| total += item.cost}
    total
  end
end
