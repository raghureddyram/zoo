class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.belongs_to :zoological_park, type: :uuid, index: true

      t.timestamps
    end
  end
end
