class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.text :name
      t.float :lat
      t.float :lng
      t.datetime :last_spawned_at

      t.timestamps
    end
  end
end
