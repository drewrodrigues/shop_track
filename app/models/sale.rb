class Sale < ApplicationRecord
  belongs_to :recipe

  def final_sale_price
    recipe.sale_price - discounted_amount
  end

  def discounted_amount
    (discount_percentage || 0) * recipe.sale_price
  end
end
