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

ActiveRecord::Schema.define(version: 20140310082950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "canned_messages", force: true do |t|
    t.text     "message"
    t.integer  "hexamail_status"
    t.boolean  "default"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "folder_id"
    t.string   "subject"
  end

  create_table "default_messages", force: true do |t|
    t.integer  "language",        default: 0
    t.integer  "hexamail_status"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "subject"
    t.integer  "folder_id"
  end

  create_table "folders", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
    t.boolean  "subject",         default: false
    t.integer  "hexamail_status"
    t.boolean  "have_plus",       default: false
  end

  create_table "gmail_accounts", force: true do |t|
    t.string   "email"
    t.text     "password"
    t.boolean  "authenticated", default: true
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.text     "subject"
    t.text     "body"
    t.datetime "sent_date"
    t.boolean  "received"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sent_to",          default: -1
    t.text     "email_identifier"
    t.boolean  "from_gmail",       default: false
    t.integer  "from_profile_id"
  end

  create_table "photos", force: true do |t|
    t.string   "url"
    t.boolean  "main"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.text     "seeking_id"
    t.text     "name"
    t.text     "real_name"
    t.text     "city"
    t.text     "country"
    t.string   "email"
    t.string   "phone"
    t.string   "skype"
    t.text     "notes"
    t.string   "age"
    t.string   "height_in_ft"
    t.string   "height_in_cm"
    t.string   "body_type"
    t.text     "language"
    t.text     "education"
    t.text     "occupation"
    t.text     "seeking"
    t.text     "expect"
    t.text     "facebook"
    t.text     "twitter"
    t.text     "tumblr"
    t.text     "blog"
    t.text     "watsapp"
    t.text     "wechat"
    t.text     "viber"
    t.text     "kik"
    t.text     "description"
    t.text     "seeking_url"
    t.text     "wink_url"
    t.text     "message_link"
    t.string   "last_login"
    t.string   "search_type"
    t.string   "wink_sent"
    t.string   "eye_color"
    t.string   "hair_color"
    t.string   "ethnicity"
    t.string   "marital_status"
    t.string   "smoking_habit"
    t.string   "drinking_habit"
    t.text     "summary"
    t.text     "i_expect"
    t.text     "arrangement_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hexamail_status"
    t.integer  "gmail_account_id"
    t.integer  "rating",                  default: 0
    t.datetime "last_sent"
    t.text     "info_data"
    t.text     "message_data"
    t.boolean  "local_option",            default: false
    t.datetime "last_received"
  end

  create_table "profiles_tags", force: true do |t|
    t.integer "profile_id"
    t.integer "tag_id"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
