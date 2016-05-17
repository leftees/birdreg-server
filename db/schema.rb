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

ActiveRecord::Schema.define(version: 0) do

  create_table "birdcatnames", force: :cascade do |t|
    t.integer "lang_id"
    t.integer "birdcat_id",             null: false
    t.string  "name",       limit: 200
  end

  create_table "birdcats", force: :cascade do |t|
    t.integer "birdcat_id"
    t.text    "info"
  end

  create_table "birdimages", force: :cascade do |t|
    t.integer "bird_id"
    t.string  "image",     limit: 200
    t.text    "info"
    t.integer "sort"
    t.boolean "visible",               default: true
    t.integer "place_id"
    t.integer "person_id"
    t.boolean "logoable",              default: true
  end

  create_table "birdnames", force: :cascade do |t|
    t.integer "lang_id"
    t.integer "bird_id",             null: false
    t.string  "name",    limit: 200
  end

  create_table "birds", force: :cascade do |t|
    t.integer "birdcat_id"
    t.text    "info"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", limit: 200
    t.text   "info"
  end

  create_table "langs", force: :cascade do |t|
    t.string  "name", limit: 200
    t.integer "sort"
  end

  create_table "observation_items", force: :cascade do |t|
    t.integer "observation_id"
    t.integer "bird_id"
    t.integer "count"
    t.text    "info"
  end

  add_index "observation_items", ["bird_id"], name: "observation_items_idx_bird_id", using: :btree
  add_index "observation_items", ["observation_id"], name: "observation_items_idx_observation_id", using: :btree

  create_table "observations", force: :cascade do |t|
    t.integer  "place_id"
    t.datetime "stamp"
    t.datetime "estamp"
    t.text     "info"
    t.datetime "created_at", default: "now()"
    t.datetime "updated_at", default: "now()"
  end

  add_index "observations", ["estamp"], name: "observations_idx_estamp", using: :btree
  add_index "observations", ["place_id"], name: "observations_idx_place_id", using: :btree
  add_index "observations", ["stamp", "estamp"], name: "observations_idx_stamp_estamp", using: :btree
  add_index "observations", ["stamp"], name: "observations_idx_stamp", using: :btree

  create_table "participants", force: :cascade do |t|
    t.integer "person_id"
    t.integer "observation_id"
  end

  add_index "participants", ["observation_id"], name: "participants_idx_observation_id", using: :btree
  add_index "participants", ["person_id"], name: "participants_idx_person_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string  "name",    limit: 200
    t.text    "info"
    t.boolean "visible",             default: true, null: false
  end

  create_table "places", force: :cascade do |t|
    t.integer "country_id"
    t.string  "obsplace",   limit: 200
    t.string  "municipal",  limit: 200
    t.text    "info"
    t.string  "obsgroup",   limit: 200
  end

  add_index "places", ["country_id"], name: "places_idx_country_id", using: :btree

  create_table "queries", force: :cascade do |t|
    t.string  "name",    limit: 200
    t.text    "data"
    t.boolean "visible",             default: true
  end

  create_table "settings", force: :cascade do |t|
    t.text "grp"
    t.text "key"
    t.text "value"
  end

  add_foreign_key "birdcatnames", "birdcats", name: "fk_birdcat"
  add_foreign_key "birdcatnames", "langs", name: "fk_lang"
  add_foreign_key "birdcats", "birdcats", name: "fk_birdcat"
  add_foreign_key "birdimages", "birds", name: "fk_bird"
  add_foreign_key "birdimages", "people", name: "fk_person"
  add_foreign_key "birdimages", "places", name: "fk_place"
  add_foreign_key "birdnames", "birds", name: "fk_bird"
  add_foreign_key "birdnames", "langs", name: "fk_lang"
  add_foreign_key "birds", "birdcats", name: "fk_birdcat"
  add_foreign_key "observation_items", "birds", name: "fk_bird"
  add_foreign_key "observation_items", "observations", name: "fk_observation"
  add_foreign_key "observations", "places", name: "fk_place"
  add_foreign_key "participants", "observations", name: "fk_observation"
  add_foreign_key "participants", "people", name: "fk_person"
  add_foreign_key "places", "countries", name: "fk_country"
end
