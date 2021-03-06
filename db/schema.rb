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

ActiveRecord::Schema.define(version: 20150220083423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.integer  "people"
    t.date     "check_in"
    t.date     "check_out"
    t.integer  "plane_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "status"
  end

  add_index "bookings", ["plane_id"], name: "index_bookings_on_plane_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "planes", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "description"
    t.integer  "seat"
    t.string   "aeroclub"
    t.boolean  "available"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "price"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "admin_area"
    t.string   "address"
    t.string   "second_picture_file_name"
    t.string   "second_picture_content_type"
    t.integer  "second_picture_file_size"
    t.datetime "second_picture_updated_at"
    t.string   "third_picture_file_name"
    t.string   "third_picture_content_type"
    t.integer  "third_picture_file_size"
    t.datetime "third_picture_updated_at"
  end

  add_index "planes", ["user_id"], name: "index_planes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                        default: "",    null: false
    t.string   "encrypted_password",           default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone_number"
    t.boolean  "pilot"
    t.text     "description"
    t.string   "aeroclub"
    t.date     "licensing"
    t.string   "license_type"
    t.integer  "flight_hours"
    t.boolean  "profile_completed"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.string   "license_picture_file_name"
    t.string   "license_picture_content_type"
    t.integer  "license_picture_file_size"
    t.datetime "license_picture_updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "name"
    t.string   "token"
    t.datetime "token_expiry"
    t.boolean  "admin",                        default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bookings", "planes"
  add_foreign_key "bookings", "users"
  add_foreign_key "planes", "users"
end
