class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.belongs_to :recipe, null: false, foreign_key: true
      t.integer :discount_percentage

      t.timestamps
    end
  end
end
