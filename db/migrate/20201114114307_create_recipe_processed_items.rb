class CreateRecipeProcessedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_processed_items do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :processed_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
