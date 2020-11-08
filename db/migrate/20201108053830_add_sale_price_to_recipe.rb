class AddSalePriceToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :sale_price, :float
  end
end
