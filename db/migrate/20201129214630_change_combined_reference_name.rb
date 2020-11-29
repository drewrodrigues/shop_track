class ChangeCombinedReferenceName < ActiveRecord::Migration[6.0]
  def change
    rename_column :combined_items, :combined_id_id, :combined_id
  end
end
