class Pokemon < ApplicationRecord
  has_many :images

  def measure(lat_start, lon_start)
    lat_end = self.lat
    lon_end = self.lng
    radius = 6378.137; # Radius of earth in KM
    distance_lat = (lat_start - lat_end) * 3.14 / 180
    distance_lon = (lon_start - lon_end) * 3.14 / 180

    a = Math.sin(distance_lat / 2) * Math.sin(distance_lat / 2) +
        Math.cos(lat_end * 3.14 / 180) * Math.cos(lat_start * 3.14 / 180) * Math.sin(distance_lon / 2) * Math.sin(distance_lon / 2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    @result = radius * c # in KM
  end
end
