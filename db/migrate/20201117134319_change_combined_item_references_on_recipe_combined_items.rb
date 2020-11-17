class ChangeCombinedItemReferencesOnRecipeCombinedItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipe_combined_items, :combined_item_id, :combined_id
  end
end
