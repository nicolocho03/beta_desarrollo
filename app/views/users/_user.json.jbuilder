json.extract! user, :id, :nombre_usuario, :password, :ubication_id, :state_id, :created_at, :updated_at
json.url user_url(user, format: :json)
