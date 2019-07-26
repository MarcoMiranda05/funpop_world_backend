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

ActiveRecord::Schema.define(version: 2019_07_26_090415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.bigint "funko_id"
    t.bigint "user_id"
    t.boolean "available_to_trade", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funko_id"], name: "index_collections_on_funko_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "funkos", force: :cascade do |t|
    t.string "name"
    t.string "fandom"
    t.string "image_url"
    t.date "release_date"
    t.string "category"
    t.integer "item_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trending_value"
    t.string "exclusivity"
    t.string "reference_url"
  end

  create_table "offers", force: :cascade do |t|
    t.integer "incoming_funko_id"
    t.integer "outcoming_funko_id"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "city"
    t.string "country"
    t.string "pic_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "funko_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funko_id"], name: "index_wishlists_on_funko_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "collections", "funkos"
  add_foreign_key "collections", "users"
  add_foreign_key "wishlists", "funkos"
  add_foreign_key "wishlists", "users"
end
