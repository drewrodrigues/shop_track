json.extract! recipe_item, :id, :inventory_item_id, :quantity, :quantity_scale, :created_at, :updated_at
json.url recipe_item_url(recipe_item, format: :json)
