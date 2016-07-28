class Pokemon < ApplicationRecord
  has_many :images

  def measure(lat_start, lng_start, lat_end = self.lat, lng_end = self.lng)

    radius = 6378.137; # Radius of earth in KM
    distance_lat = (lat_start - lat_end) * 3.14 / 180
    distance_lng = (lng_start - lng_end) * 3.14 / 180

    a = Math.sin(distance_lat / 2) * Math.sin(distance_lat / 2) +
        Math.cos(lat_end * 3.14 / 180) * Math.cos(lat_start * 3.14 / 180) * Math.sin(distance_lng / 2) * Math.sin(distance_lng / 2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    @result = radius * c # in KM
  end

  # Static method.
  # Sort pokemons by distance.
  def self.sort_by_distance(lat_start, lng_start, count = 0)
    @tab = Hash.new
    @pokemons = Pokemon.all

    @pokemons.each do |pokemon|
      @tab[pokemon.measure(lat_start, lng_start, pokemon.lat, pokemon.lng)] = pokemon
    end
    @tab = @tab.sort_by { |k, v| k }
    if count == 0
      return @tab
    else
      return @tab.first count
    end
  end

  # Static method.
  # Get random order by distance.
  def self.get_random_by_distance(lat_start, lng_start, distance = 1)
    @tab = Hash.new
    if distance > 0
      @pokemons = Pokemon.all

      @pokemons.each do |pokemon|
        dist = pokemon.measure(lat_start, lng_start, pokemon.lat, pokemon.lng)
        if dist <= distance
          @tab[dist] = pokemon
        end
      end
    end
    return @tab.sort_by { rand }
  end
  
end
