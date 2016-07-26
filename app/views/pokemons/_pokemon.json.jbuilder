json.extract! pokemon, :id, :name, :lat, :lng, :last_spawned_at, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)