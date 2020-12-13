class AddCategoryIdToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_reference :receipts, :category
  end
end
