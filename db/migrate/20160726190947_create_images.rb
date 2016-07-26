class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :pokemon, foreign_key: true
      t.text :url

      t.timestamps
    end
  end
end
