class CreateInventoryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.belongs_to :kitchen_item, null: false, foreign_key: true
      t.integer :count
      t.float :quantity
      t.float :price
      t.string :quantity_scale

      t.timestamps
    end
  end
end
