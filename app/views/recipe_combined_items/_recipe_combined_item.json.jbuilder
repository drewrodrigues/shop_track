json.extract! recipe_combined_item, :id, :recipe_id, :combined_item_id, :quantity, :created_at, :updated_at
json.url recipe_combined_item_url(recipe_combined_item, format: :json)
