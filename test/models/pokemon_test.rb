require 'test_helper'

class PokemonTest < ActiveSupport::TestCase

  setup do
    @pokemon = Pokemon.new
    @pokemon.lat = 66.1287
    @pokemon.lng = 41.2615
  end

  test "calculate_measure_1" do
    distance = @pokemon.measure(0.0, 0.0)
    assert_equal 8043.910962937359, distance
  end

  test "calculate_measure_2" do
    distance = @pokemon.measure(0.0, 0.0, 0.0, 0.0)
    assert_equal 0.0, distance
  end

  test "calculate_measure_3" do
    distance = @pokemon.measure(1.2, 2.1, 1.2, 2.1)
    assert_equal 0.0, distance
  end

  test "calculate_measure_4" do
    @pokemon.lat = -10.0
    @pokemon.lng = -10.0
    distance = @pokemon.measure(1.2, 2.1)
    assert_equal 1829.9781077757527, distance
  end

  test "sort_by_distance_1" do
    pokemons = Pokemon.sort_by_distance(1, 1)
    assert_equal Pokemon.all.count, pokemons.count
  end
end
