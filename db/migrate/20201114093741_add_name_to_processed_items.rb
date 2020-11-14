class AddNameToProcessedItems < ActiveRecord::Migration[6.0]
  def change
    add_column :processed_items, :name, :string
  end
end
