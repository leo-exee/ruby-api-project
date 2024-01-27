class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :pokemonType
      t.integer :level
      t.string :evolutionOf
      t.string :nextEvolution
      t.text :description

      t.timestamps
    end
  end
end
