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

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2023_05_13_122337) do
=======
ActiveRecord::Schema[7.0].define(version: 2023_05_13_162026) do
>>>>>>> Simone
  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_charge_id"
    t.boolean "refunded", default: false, null: false
    t.integer "num_pers"
    t.index ["post_id"], name: "index_bookings_on_post_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "region"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "country_id"
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "language_id", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text "descrizione"
    t.string "titolo"
    t.datetime "data", precision: nil
    t.time "ora"
    t.string "lingua"
    t.integer "persone"
    t.integer "prezzo"
    t.string "nomeC"
    t.string "regioneC"
    t.string "nomeP"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "numero_ore"
    t.integer "persone_rimanenti"
    t.string "user_email"
    t.integer "user_id"
    t.string "address"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "iva"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id", default: 9, null: false
    t.string "provider"
    t.string "uid"
    t.integer "city_id"
    t.string "stripe_account_id"
    t.string "lat"
    t.string "long"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "bookings", "posts"
  add_foreign_key "bookings", "users"
  add_foreign_key "cities", "countries"
  add_foreign_key "posts", "users", column: "user_email", primary_key: "email"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "roles"
end
