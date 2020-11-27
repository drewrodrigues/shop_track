class ChangeSaleToAlignWithSaleItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :sales, :recipe_id
    remove_column :sales, :discount_percentage
    add_reference :sale_items, :recipe
  end
end
