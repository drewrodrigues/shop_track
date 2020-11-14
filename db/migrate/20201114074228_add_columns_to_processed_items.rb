class AddColumnsToProcessedItems < ActiveRecord::Migration[6.0]
  def change
    add_column :processed_items, :initial_quantity, :float
    add_column :processed_items, :initial_scale, :string
  end
end
