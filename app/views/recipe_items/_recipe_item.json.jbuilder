json.extract! recipe_item, :id, :receipt_id, :quantity, :quantity_scale, :recipe_id, :created_at, :updated_at
json.url recipe_item_url(recipe_item, format: :json)
