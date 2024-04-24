class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes, id: :uuid do |t|
      t.jsonb :data
      t.references :notable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
