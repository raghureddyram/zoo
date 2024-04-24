class AddStatusToAnimal < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :status, :integer, null: false, default: 0
  end
end
