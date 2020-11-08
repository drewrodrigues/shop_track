class AddReceiptNumberToSales < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :receipt_number, :string
  end
end
