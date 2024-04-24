class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :name
      t.references :animal, type: :uuid, index: true
      t.interval :scheduling_interval
      t.datetime :due
      t.integer :status, null: false, default: 0
      t.integer :type

      t.timestamps
    end
  end
end
