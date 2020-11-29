class RemoveUnnessaryForeignKeyContraint < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key "recipe_combined_items", "combined_items", column: "combined_id"
  end
end
