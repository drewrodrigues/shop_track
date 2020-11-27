class CreateSaleItems < ActiveRecord::Migration[6.0]
  def change
    create_table :sale_items do |t|
      t.references :sale, null: false, foreign_key: true
      t.float :pos_sum
      t.integer :quantity

      t.timestamps
    end
  end
end
