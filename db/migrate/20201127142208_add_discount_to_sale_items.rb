class AddDiscountToSaleItems < ActiveRecord::Migration[6.0]
  def change
    add_column :sale_items, :discount, :float
  end
end
