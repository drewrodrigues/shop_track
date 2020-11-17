class CreateRecipeCombinedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_combined_items do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :combined_item, null: false, foreign_key: true
      t.float :quantity

      t.timestamps
    end
  end
end
