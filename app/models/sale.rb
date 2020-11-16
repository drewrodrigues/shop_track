# == Schema Information
#
# Table name: sales
#
#  id                  :bigint           not null, primary key
#  recipe_id           :bigint           not null
#  discount_percentage :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  receipt_number      :string
#
class Sale < ApplicationRecord
  belongs_to :recipe

  def final_sale_price
    recipe.sale_price - discounted_amount
  end

  def discounted_amount
    (discount_percentage || 0) * recipe.sale_price
  end
end
