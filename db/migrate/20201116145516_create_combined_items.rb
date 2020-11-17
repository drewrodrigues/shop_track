class CreateCombinedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :combined_items do |t|
      t.references :receipt, null: false, foreign_key: true
      t.float :quantity
      t.string :quantity_scale
      t.references :combined, null: false, foreign_key: true

      t.timestamps
    end
  end
end
