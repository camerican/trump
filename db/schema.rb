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

ActiveRecord::Schema.define(version: 20150723181829) do

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.float  "geo_x"
    t.float  "geo_y"
  end

  add_index "locations", ["geo_x"], name: "index_locations_on_geo_x"
  add_index "locations", ["geo_y"], name: "index_locations_on_geo_y"
  add_index "locations", ["name"], name: "index_locations_on_name"

  create_table "organization_positions", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "position_id"
    t.datetime "start"
    t.datetime "end"
  end

  add_index "organization_positions", ["end"], name: "index_organization_positions_on_end"
  add_index "organization_positions", ["organization_id"], name: "index_organization_positions_on_organization_id"
  add_index "organization_positions", ["position_id"], name: "index_organization_positions_on_position_id"
  add_index "organization_positions", ["start"], name: "index_organization_positions_on_start"

  create_table "organizations", force: :cascade do |t|
    t.string  "name"
    t.integer "location_id"
    t.integer "category"
  end

  add_index "organizations", ["category"], name: "index_organizations_on_category"
  add_index "organizations", ["location_id"], name: "index_organizations_on_location_id"

  create_table "positions", force: :cascade do |t|
    t.string "name"
  end

end
