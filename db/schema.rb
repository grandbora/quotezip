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

ActiveRecord::Schema.define(version: 20131201152409) do

  create_table "quotes", force: true do |t|
    t.text     "content"
    t.string   "book"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.integer  "user_id"
    t.integer  "quote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["quote_id"], name: "index_reports_on_quote_id", using: :btree
  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.integer  "uid"
    t.string   "user_name"
    t.string   "name"
    t.text     "avatar"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "quote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["quote_id"], name: "index_votes_on_quote_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
