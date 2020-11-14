class CreateRecipeItems < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_items do |t|
      t.belongs_to :receipt, null: false, foreign_key: true
      t.float :quantity
      t.string :quantity_scale
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
