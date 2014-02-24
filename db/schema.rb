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

ActiveRecord::Schema.define(version: 20140128011549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "item_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_category_attribute_data_types", force: true do |t|
    t.string   "label"
    t.string   "rails_data_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_category_attributes", force: true do |t|
    t.integer  "item_category_id"
    t.string   "label"
    t.integer  "item_category_attribute_data_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "item_category_id"
    t.hstore   "values"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["values"], name: "items_values", using: :gin

end
