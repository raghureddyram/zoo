# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_04_24_045101) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "animals", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "species"
    t.uuid "primary_habitat_id"
    t.uuid "current_habitat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.index ["current_habitat_id"], name: "index_animals_on_current_habitat_id"
    t.index ["primary_habitat_id"], name: "index_animals_on_primary_habitat_id"
  end

  create_table "animals_employees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "animal_id"
    t.uuid "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_animals_employees_on_animal_id"
    t.index ["employee_id"], name: "index_animals_employees_on_employee_id"
  end

  create_table "employees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.uuid "zoological_park_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zoological_park_id"], name: "index_employees_on_zoological_park_id"
  end

  create_table "habitats", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "zoological_park_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zoological_park_id"], name: "index_habitats_on_zoological_park_id"
  end

  create_table "notes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "data"
    t.string "notable_type", null: false
    t.bigint "notable_id", null: false
    t.uuid "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_notes_on_creator_id"
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description"
    t.string "name"
    t.uuid "animal_id"
    t.interval "scheduling_interval"
    t.datetime "due"
    t.integer "status", default: 0, null: false
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_tasks_on_animal_id"
  end

  create_table "zoological_parks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "animals", "habitats", column: "current_habitat_id"
  add_foreign_key "animals", "habitats", column: "primary_habitat_id"
  add_foreign_key "notes", "employees", column: "creator_id"
end
