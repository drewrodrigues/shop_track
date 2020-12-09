# == Schema Information
#
# Table name: recipes
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sale_price :float
#
class Recipe < ApplicationRecord
  has_one_attached :photo
  has_many :recipe_items, dependent: :destroy
  has_many :recipe_combined_items, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :sale_price, presence: true

  def total_cost
    total = 0
    recipe_items.each {|item| total += item.cost}
    total
  end
end
