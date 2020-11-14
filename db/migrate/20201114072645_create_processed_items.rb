class CreateProcessedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :processed_items do |t|
      t.references :receipt, null: false, foreign_key: true
      t.float :converts_to_quantity
      t.string :converts_to_scale

      t.timestamps
    end
  end
end
