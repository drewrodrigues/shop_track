class Change < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipe_items, :inventory_item_id, :receipt_id
  end
end
