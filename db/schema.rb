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

ActiveRecord::Schema[7.2].define(version: 2024_04_16_145750) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days", force: :cascade do |t|
    t.string "location"
    t.text "notes"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.bigint "lodging_id"
    t.index ["lodging_id"], name: "index_days_on_lodging_id"
    t.index ["trip_id"], name: "index_days_on_trip_id"
  end

  create_table "happenings", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.text "notes"
    t.boolean "booked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "happeningable_type", null: false
    t.bigint "happeningable_id", null: false
    t.bigint "trip_id"
    t.datetime "time"
    t.index ["day_id"], name: "index_happenings_on_day_id"
    t.index ["happeningable_type", "happeningable_id"], name: "index_happenings_on_happeningable"
    t.index ["trip_id"], name: "index_happenings_on_trip_id"
  end

  create_table "lodgings", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "link"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trip_id", null: false
    t.index ["trip_id"], name: "index_lodgings_on_trip_id"
  end

  create_table "sometimes", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.string "name"
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_sometimes_on_trip_id"
  end

  create_table "transportations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mode"
    t.string "origin"
    t.string "destination"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.boolean "active", default: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  add_foreign_key "days", "lodgings"
  add_foreign_key "days", "trips"
  add_foreign_key "happenings", "days"
  add_foreign_key "lodgings", "trips"
  add_foreign_key "sometimes", "trips"
  add_foreign_key "trips", "users"
end
