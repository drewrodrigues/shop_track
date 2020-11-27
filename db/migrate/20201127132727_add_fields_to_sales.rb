class AddFieldsToSales < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :pos_datetime, :datetime, null: false
    add_column :sales, :pos_total, :float, null: false
    add_column :sales, :pos_fiscal_number, :float, null: false
  end
end
