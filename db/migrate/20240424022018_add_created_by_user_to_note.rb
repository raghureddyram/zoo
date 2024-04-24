class AddCreatedByUserToNote < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :creator, type: :uuid, foreign_key: { to_table: :employees }
  end
end
