class AddDateToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :date, :date
  end
end
