json.extract! receipt, :id, :kitchen_item_id, :count, :quantity, :price, :quantity_scale, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
