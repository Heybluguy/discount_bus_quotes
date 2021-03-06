# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181231040145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "company_states", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "state_id"
    t.index ["company_id"], name: "index_company_states_on_company_id"
    t.index ["state_id"], name: "index_company_states_on_state_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_images_on_company_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "category"
    t.integer "seats"
    t.integer "price"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_vehicles_on_company_id"
  end

  add_foreign_key "companies", "users"
  add_foreign_key "company_states", "companies"
  add_foreign_key "company_states", "states"
  add_foreign_key "images", "companies"
  add_foreign_key "vehicles", "companies"
end
