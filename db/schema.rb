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

ActiveRecord::Schema.define(version: 20170531122259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: :cascade do |t|
    t.string   "name"
    t.string   "brand"
    t.string   "model"
    t.integer  "build"
    t.integer  "odometer"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bikes_on_user_id", using: :btree
  end

  create_table "maintenances", force: :cascade do |t|
    t.integer  "odometer"
    t.decimal  "costs"
    t.boolean  "oil"
    t.boolean  "sparkplugs"
    t.boolean  "airfilter"
    t.boolean  "oilfilter"
    t.boolean  "coolingfluid"
    t.boolean  "chain"
    t.boolean  "break_front"
    t.boolean  "break_back"
    t.boolean  "breakfluid"
    t.boolean  "tyres"
    t.integer  "bike_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.date     "date"
    t.index ["bike_id"], name: "index_maintenances_on_bike_id", using: :btree
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "bike_id"
    t.integer  "oil"
    t.integer  "sparkplugs"
    t.integer  "airfilter"
    t.integer  "oilfilter"
    t.integer  "coolingfluid"
    t.integer  "chain"
    t.integer  "break_front"
    t.integer  "break_back"
    t.integer  "breakfluid"
    t.integer  "tyres"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["bike_id"], name: "index_schedules_on_bike_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bikes", "users"
  add_foreign_key "maintenances", "bikes"
  add_foreign_key "schedules", "bikes"
end
