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

ActiveRecord::Schema.define(version: 20171031223434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.bigint "roof_set_id"
    t.string "name"
    t.string "slug"
    t.text "description"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.float "latitude"
    t.float "longitude"
    t.string "sunroof_url"
    t.string "sunroof_ajax_url"
    t.integer "roof_sq_feet"
    t.integer "sunlight_hours"
    t.string "utility"
    t.integer "gnis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "exclude"
    t.text "notes"
    t.integer "adjusted_sq_feet"
    t.float "installed_kw"
    t.index ["name"], name: "index_buildings_on_name"
    t.index ["roof_set_id"], name: "index_buildings_on_roof_set_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "roof_sets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "slug"
    t.text "description"
    t.text "csv_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_roof_sets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "slug"
    t.string "image_url"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "buildings", "roof_sets"
  add_foreign_key "roof_sets", "users"
end
