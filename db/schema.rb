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

ActiveRecord::Schema.define(version: 20151028124427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "styles", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.string   "background_color"
    t.string   "block_height"
    t.string   "name_color"
    t.string   "name_style"
    t.string   "name_size"
    t.string   "text_color"
    t.string   "text_style"
    t.string   "text_size"
    t.string   "email_color"
    t.string   "email_style"
    t.string   "email_size"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "logo"
    t.string   "css"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
