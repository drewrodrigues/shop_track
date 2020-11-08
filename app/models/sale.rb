class Sale < ApplicationRecord
  belongs_to :recipe

  def final_sale_price
    recipe.sale_price * (discount_percentage || 1)
  end
end
