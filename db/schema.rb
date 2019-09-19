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

ActiveRecord::Schema.define(version: 2019_09_16_100156) do

  create_table "addresses", force: :cascade do |t|
    t.integer "end_user_id", default: 0, null: false
    t.string "postal_code_1", limit: 3, default: "000", null: false
    t.string "postal_code_2", limit: 4, default: "0000", null: false
    t.string "address", default: "", null: false
    t.string "telephone_number", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.integer "is_main", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "administrators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
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
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "arrival_histories", force: :cascade do |t|
    t.integer "product_id", default: 0, null: false
    t.integer "arrival_number", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "product_id", default: 0, null: false
    t.integer "end_user_id", default: 0, null: false
    t.integer "product_number", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "end_user_id", default: 0, null: false
    t.string "subject", default: "", null: false
    t.text "contact_body", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disks", force: :cascade do |t|
    t.integer "product_id", default: 0, null: false
    t.integer "disk_number", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "end_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "last_name_kanji"
    t.string "first_name_kanji"
    t.string "last_name_katakana"
    t.string "first_name_katakana"
    t.integer "is_deleted", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_end_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_end_users_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "end_user_id", default: 0, null: false
    t.integer "product_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_history_id", default: 0, null: false
    t.integer "product_id", default: 0, null: false
    t.integer "product_number", default: 0, null: false
    t.integer "unit_price", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_histories", force: :cascade do |t|
    t.integer "end_user_id", default: 0, null: false
    t.string "last_name_kanji"
    t.string "first_name_kanji"
    t.string "postal_code_1"
    t.string "postal_code_2"
    t.string "address"
    t.string "telephone_number"
    t.integer "pay_method"
    t.integer "order_status", default: 0
    t.integer "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "image_id", default: "", null: false
    t.integer "price", default: 0, null: false
    t.integer "product_status", default: 0, null: false
    t.string "cd_name", default: "", null: false
    t.integer "is_deleted", default: 0, null: false
    t.string "label_name"
    t.string "artist_name"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "product_id", default: 0, null: false
    t.integer "end_user_id", default: 0, null: false
    t.string "subject", default: "", null: false
    t.text "review_body", default: "", null: false
    t.float "rating", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.integer "disk_id", default: 0, null: false
    t.string "song_name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
