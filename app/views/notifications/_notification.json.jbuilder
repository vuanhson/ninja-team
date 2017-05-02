json.extract! notification, :id, :user_id, :type, :post_id, :read, :x_user_id, :created_at, :updated_at
json.url notification_url(notification, format: :json)
