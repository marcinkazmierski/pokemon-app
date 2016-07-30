json.pokemons @pokemons.each do |distance, pokemon|
  json.id pokemon.id
  json.name pokemon.name
  json.lat pokemon.lat
  json.lng pokemon.lng
  json.last_spawned_at pokemon.last_spawned_at
  json.distance distance

  json.images pokemon.images.each do |image|
    json.url image.url
  end
end
