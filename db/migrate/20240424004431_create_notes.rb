class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes, id: :uuid do |t|
      t.jsonb :data
      t.references :notable, type: :uuid, polymorphic: true, null: false
      t.references :creator, type: :uuid, foreign_key: { to_table: :employees }


      t.timestamps
    end
  end
end
