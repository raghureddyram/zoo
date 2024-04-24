class CreateAnimalsEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :animals_employees, id: :uuid do |t|

      t.references :animal, type: :uuid, index: true
      t.references :employee, type: :uuid, index: true
      t.timestamps
    end
  end
end
