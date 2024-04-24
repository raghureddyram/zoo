class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals, id: :uuid do |t|
      t.string :species
      
      t.belongs_to :primary_habitat, index: true, type: :uuid, null: true, foreign_key: {to_table: :habitats}
      t.belongs_to :current_habitat, index: true, type: :uuid, null: true, foreign_key: {to_table: :habitats}

      t.timestamps
    end
  end
end
