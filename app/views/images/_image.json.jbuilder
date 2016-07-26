json.extract! image, :id, :pokemon_id, :url, :created_at, :updated_at
json.url image_url(image, format: :json)