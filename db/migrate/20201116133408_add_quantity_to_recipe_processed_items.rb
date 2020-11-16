class AddQuantityToRecipeProcessedItems < ActiveRecord::Migration[6.0]
  def change
    add_column :recipe_processed_items, :quantity, :float
  end
end
