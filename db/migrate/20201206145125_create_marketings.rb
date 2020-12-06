class CreateMarketings < ActiveRecord::Migration[6.0]
  def change
    create_table :marketings do |t|
      t.date :date_used
      t.integer :quantity

      t.timestamps
    end
  end
end
