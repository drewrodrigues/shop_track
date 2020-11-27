json.extract! sale_item, :id, :sale_id, :pos_sum, :quantity, :created_at, :updated_at
json.url sale_item_url(sale_item, format: :json)
