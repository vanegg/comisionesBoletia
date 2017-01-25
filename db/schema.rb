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

ActiveRecord::Schema.define(version: 20170125194137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.decimal  "price_ticket",     null: false
    t.integer  "ticket_quantity",  null: false
    t.string   "payment_method",   null: false
    t.decimal  "commission",       null: false
    t.decimal  "total_commission", null: false
    t.decimal  "total_price",      null: false
    t.integer  "event_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["event_id"], name: "index_bookings_on_event_id", using: :btree
  end

  create_table "commissions", force: :cascade do |t|
    t.decimal  "card",       default: "3.5",  null: false
    t.decimal  "deposit",    default: "10.0", null: false
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "booking_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["booking_id"], name: "index_commissions_on_booking_id", using: :btree
    t.index ["event_id"], name: "index_commissions_on_event_id", using: :btree
    t.index ["user_id"], name: "index_commissions_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "place",                         null: false
    t.string   "category",                      null: false
    t.integer  "assistance",                    null: false
    t.date     "date_event",                    null: false
    t.string   "description"
    t.boolean  "hasCommission", default: false
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "email",                         null: false
    t.string   "address",                       null: false
    t.string   "phone"
    t.string   "account",                       null: false
    t.boolean  "hasCommission", default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end
