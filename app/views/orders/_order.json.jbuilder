json.extract! order, :id, :quantity, :total, :state, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
