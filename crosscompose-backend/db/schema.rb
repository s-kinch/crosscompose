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

ActiveRecord::Schema.define(version: 20180522142454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clues", force: :cascade do |t|
    t.integer "puzzle_id"
    t.boolean "across"
    t.integer "number"
    t.string "text"
  end

  create_table "letters", force: :cascade do |t|
    t.integer "puzzle_id"
    t.integer "x"
    t.integer "y"
    t.boolean "black"
    t.string "value"
    t.integer "across_clue_id"
    t.integer "down_clue_id"
  end

  create_table "puzzles", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.boolean "published", default: false
  end

end
