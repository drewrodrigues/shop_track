class AddQuantityToCombineds < ActiveRecord::Migration[6.0]
  def change
    add_column :combineds, :quantity, :float
  end
end
