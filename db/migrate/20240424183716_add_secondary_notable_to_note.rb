class AddSecondaryNotableToNote < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :secondary_notable, type: :uuid, polymorphic: true
  end
end