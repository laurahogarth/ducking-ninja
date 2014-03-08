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

ActiveRecord::Schema.define(version: 20140308130151) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "agent_details", force: true do |t|
    t.integer  "agent_id"
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "town"
    t.string   "county"
    t.string   "postcode"
    t.string   "email"
    t.string   "main_phone"
    t.string   "alt_phone"
    t.string   "fax"
    t.string   "website"
    t.string   "managers_name"
    t.string   "opening_hours"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agents", force: true do |t|
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
    t.boolean  "verified",               default: false
  end

  add_index "agents", ["email"], name: "index_agents_on_email", unique: true
  add_index "agents", ["reset_password_token"], name: "index_agents_on_reset_password_token", unique: true

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "iso_2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favourite_countries", force: true do |t|
    t.integer  "country_id"
    t.integer  "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holidays", force: true do |t|
    t.integer  "traveller_id"
    t.integer  "country_id"
    t.string   "region"
    t.integer  "nights"
    t.date     "earliest_date"
    t.date     "latest_date"
    t.integer  "budget"
    t.boolean  "ballpark",       default: true
    t.integer  "adults",         default: 2
    t.integer  "children",       default: 0
    t.boolean  "include_travel", default: true
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "open",           default: true
  end

  create_table "pitches", force: true do |t|
    t.integer  "min"
    t.integer  "max"
    t.integer  "expertise",  default: 0
    t.text     "content"
    t.integer  "agent_id"
    t.integer  "holiday_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",     default: 0
    t.boolean  "seen",       default: false
    t.string   "ref"
  end

  create_table "travellers", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "travellers", ["email"], name: "index_travellers_on_email", unique: true
  add_index "travellers", ["reset_password_token"], name: "index_travellers_on_reset_password_token", unique: true

end
