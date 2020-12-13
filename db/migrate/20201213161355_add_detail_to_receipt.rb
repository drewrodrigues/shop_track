class AddDetailToReceipt < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :detail, :string
  end
end
