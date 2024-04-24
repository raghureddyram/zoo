class CreateZoologicalParks < ActiveRecord::Migration[7.0]
  def change
    create_table :zoological_parks, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
