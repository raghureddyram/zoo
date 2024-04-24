class CreateHabitats < ActiveRecord::Migration[7.0]
  def change
    create_table :habitats, id: :uuid do |t|
      t.string :name
      t.references :zoological_parks, type: :uuid, index: true

      t.timestamps
    end
  end
end
