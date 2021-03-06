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

ActiveRecord::Schema.define(version: 20140707023147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "todo_lists", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "todo_lists", ["user_id"], name: "index_todo_lists_on_user_id", using: :btree

  create_table "todos", force: true do |t|
    t.string   "title"
    t.text     "notes"
    t.boolean  "complete",     default: false
    t.date     "due"
    t.integer  "todo_list_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "todos", ["todo_list_id"], name: "index_todos_on_todo_list_id", using: :btree
  add_index "todos", ["user_id"], name: "index_todos_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
