class AddQuantityScaleToCombineds < ActiveRecord::Migration[6.0]
  def change
    add_column :combineds, :quantity_scale, :string
  end
end
