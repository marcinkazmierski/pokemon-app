# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Image.destroy_all
Pokemon.destroy_all

# Generate pokemons with images.
100.times do |index|
  Pokemon.create!(name: Faker::Pokemon.name,
                  lat: '%.4f' % Faker::Address.latitude,
                  lng: '%.4f' % Faker::Address.longitude,
                  last_spawned_at: Faker::Time.between(3.months.ago, 1.day.ago))
  # Generate random avatars for pokemon.
  2.times do |index2|
    Image.create!(url: Faker::Avatar.image("pokemon-image-#{index}-#{index2}", "100x100"),
                  pokemon_id: Pokemon.last.id)
  end
end

p "Created #{Pokemon.count} pokemons and #{Image.count} images."

