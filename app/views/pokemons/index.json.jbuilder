json.pokemons @pokemons.each do |k, tab|
  json.id tab['pokemon'].id
  json.name tab['pokemon'].name
  json.lat tab['pokemon'].lat
  json.lng tab['pokemon'].lng
  json.last_spawned_at tab['pokemon'].last_spawned_at
  json.distance tab['distance']

  json.images tab['pokemon'].images.each do |image|
    json.url image.url
  end
end
