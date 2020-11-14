json.extract! processed_item, :id, :receipt_id, :converts_to_quantity, :converts_to_scale, :created_at, :updated_at
json.url processed_item_url(processed_item, format: :json)
