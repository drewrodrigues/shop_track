class RemoveQuantityScaleFromRecipeItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipe_items, :quantity_scale
  end
end
