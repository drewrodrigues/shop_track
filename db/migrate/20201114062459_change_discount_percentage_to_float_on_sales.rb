class ChangeDiscountPercentageToFloatOnSales < ActiveRecord::Migration[6.0]
  def change
    change_column :sales, :discount_percentage, :float
  end
end
