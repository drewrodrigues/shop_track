class AddNameToSaleItems < ActiveRecord::Migration[6.0]
  def change
    add_column :sale_items, :name, :string, null: false
  end
end
