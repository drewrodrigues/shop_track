class ChangeInventoryItemsToRecipes < ActiveRecord::Migration[6.0]
  def change
    rename_table :receipts, :receipts
  end
end
