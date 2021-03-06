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

ActiveRecord::Schema.define(version: 2019_06_02_020120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "ies"
    t.string "city"
    t.string "field1"
    t.string "field2"
    t.string "field3"
    t.string "field4"
    t.string "field5"
    t.string "field6"
    t.string "field7"
    t.string "field8"
    t.string "field9"
    t.string "field10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "field11"
    t.string "field12"
    t.string "field13"
    t.string "field14"
    t.string "field15"
    t.string "field16"
    t.string "field17"
    t.string "field18"
    t.string "field19"
    t.string "field20"
    t.string "ies_full"
    t.string "estagio"
    t.string "about"
    t.string "relatede_course"
    t.string "mec_score"
    t.string "course_grade"
    t.string "cep"
    t.string "lat"
    t.string "lng"
  end

end
