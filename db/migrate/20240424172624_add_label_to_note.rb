class AddLabelToNote < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :label, :integer, null: true
  end
end
