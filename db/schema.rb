# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141110160825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asking_prices", force: true do |t|
    t.integer  "item_id",                                               null: false
    t.boolean  "current",                                default: true
    t.integer  "visit_count",                            default: 0
    t.integer  "offer_count",                            default: 0
    t.integer  "question_count",                         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",         precision: 8, scale: 2,                null: false
  end

  add_index "asking_prices", ["item_id"], name: "index_asking_prices_on_item_id", using: :btree

  create_table "bundles", force: true do |t|
    t.string   "title",                      null: false
    t.boolean  "restricted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.integer  "room_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["room_id"], name: "index_categories_on_room_id", using: :btree

  create_table "favorites", force: true do |t|
    t.integer  "item_id",      null: false
    t.integer  "favoriter_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["favoriter_id"], name: "index_favorites_on_favoriter_id", using: :btree
  add_index "favorites", ["item_id", "favoriter_id"], name: "index_favorites_on_item_id_and_favoriter_id", unique: true, using: :btree
  add_index "favorites", ["item_id"], name: "index_favorites_on_item_id", using: :btree

  create_table "item_bundles", force: true do |t|
    t.integer  "item_id",    null: false
    t.integer  "bundle_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_bundles", ["bundle_id"], name: "index_item_bundles_on_bundle_id", using: :btree
  add_index "item_bundles", ["item_id", "bundle_id"], name: "index_item_bundles_on_item_id_and_bundle_id", unique: true, using: :btree
  add_index "item_bundles", ["item_id"], name: "index_item_bundles_on_item_id", using: :btree

  create_table "item_photos", force: true do |t|
    t.string   "photo",      null: false
    t.integer  "item_id",    null: false
    t.string   "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_photos", ["item_id"], name: "index_item_photos_on_item_id", using: :btree

  create_table "item_specials", force: true do |t|
    t.integer  "item_id",    null: false
    t.integer  "special_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_specials", ["item_id", "special_id"], name: "index_item_specials_on_item_id_and_special_id", unique: true, using: :btree

  create_table "items", force: true do |t|
    t.string   "title",                                     null: false
    t.text     "description",                               null: false
    t.string   "dimensions"
    t.string   "brand"
    t.string   "condition",                                 null: false
    t.integer  "age"
    t.integer  "user_id",                                   null: false
    t.integer  "submission_id",                             null: false
    t.integer  "category_id",                               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id",                               null: false
    t.integer  "accepted_offer_id"
    t.decimal  "purchase_price",    precision: 8, scale: 2
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["location_id"], name: "index_items_on_location_id", using: :btree
  add_index "items", ["submission_id"], name: "index_items_on_submission_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "address",                    null: false
    t.string   "city",                       null: false
    t.string   "state",                      null: false
    t.string   "zip",                        null: false
    t.string   "name",                       null: false
    t.boolean  "default",    default: false, null: false
    t.integer  "user_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "offers", force: true do |t|
    t.integer  "user_id",     null: false
    t.integer  "item_id",     null: false
    t.float    "amount",      null: false
    t.datetime "accepted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offers", ["item_id"], name: "index_offers_on_item_id", using: :btree
  add_index "offers", ["user_id"], name: "index_offers_on_user_id", using: :btree

  create_table "rooms", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specials", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "specials", ["name"], name: "index_specials_on_name", unique: true, using: :btree

  create_table "submissions", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "full_name",                              null: false
    t.string   "username"
    t.string   "phone_number",                           null: false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip",                                    null: false
    t.boolean  "legacy",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "second_phone"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["phone_number"], name: "index_users_on_phone_number", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
