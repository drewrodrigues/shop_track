class UpdateFields < ActiveRecord::Migration[6.0]
  def change
    remove_column :sales, :receipt_number
    change_column :sales, :pos_fiscal_number, :string, null: false, uniqueness: true
  end
end
