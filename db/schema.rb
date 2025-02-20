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

ActiveRecord::Schema[8.0].define(version: 2025_02_20_081304) do
  create_table "give_points", force: :cascade do |t|
    t.integer "amount", null: false
    t.integer "from_id", null: false
    t.integer "to_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_id"], name: "index_give_points_on_from_id"
    t.index ["to_id"], name: "index_give_points_on_to_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "from_id", null: false
    t.integer "to_id", null: false
    t.integer "give_point_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_id"], name: "index_messages_on_from_id"
    t.index ["give_point_id"], name: "index_messages_on_give_point_id"
    t.index ["to_id"], name: "index_messages_on_to_id"
  end

  create_table "point_decreases", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_point_decreases_on_user_id"
  end

  create_table "point_increases", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_point_increases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "give_points", "users", column: "from_id"
  add_foreign_key "give_points", "users", column: "to_id"
  add_foreign_key "messages", "users", column: "from_id"
  add_foreign_key "messages", "users", column: "to_id"
end
