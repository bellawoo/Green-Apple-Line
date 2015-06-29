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

ActiveRecord::Schema.define(version: 20150629155613) do

  create_table "bikes", force: :cascade do |t|
    t.string   "location"
    t.integer  "bikes_avail"
    t.integer  "docks_avail"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "distance"
  end

  create_table "buses", force: :cascade do |t|
    t.integer  "stop_id"
    t.float    "lat"
    t.float    "long"
    t.string   "stop_name"
    t.string   "direction"
    t.string   "route_id"
    t.float    "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trains", force: :cascade do |t|
    t.string   "arriving_at"
    t.string   "line_code1"
    t.string   "destination"
    t.string   "minutes"
    t.float    "lat"
    t.float    "long"
    t.float    "distance"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "line_code2"
    t.string   "line_code3"
    t.string   "other_platform"
    t.string   "station_code"
  end

end
