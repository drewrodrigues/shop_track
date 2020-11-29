class MoveReceiptIdToCombinedItemSelfJoin < ActiveRecord::Migration[6.0]
  def change
    CombinedItem.all.each do |combined_item|
      next unless combined_item.receipt_id
      receipt = Receipt.find(combined_item.receipt_id)
      combined_item.itemable = receipt
      combined_item.save
    end
    remove_column :combined_items, :receipt_id
  end
end
