json.extract! inventory_item, :id, :kitchen_item_id, :count, :quantity, :price, :quantity_scale, :created_at, :updated_at
json.url inventory_item_url(inventory_item, format: :json)
