class AllowReceiptsIdToBeNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :combined_items, :receipt_id, true
  end
end
