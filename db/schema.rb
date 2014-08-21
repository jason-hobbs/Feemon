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

ActiveRecord::Schema.define(version: 20140626012701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dashboards", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feed_id"
    t.integer  "entry_id"
    t.boolean  "read",            default: false
    t.text     "entry_title"
    t.datetime "entry_published"
    t.text     "entry_link"
  end

  add_index "dashboards", ["entry_id"], name: "index_dashboards_on_entry_id", using: :btree
  add_index "dashboards", ["feed_id"], name: "index_dashboards_on_feed_id", using: :btree
  add_index "dashboards", ["user_id"], name: "index_dashboards_on_user_id", using: :btree

  create_table "entries", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.text     "link"
    t.integer  "feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published"
  end

  add_index "entries", ["feed_id"], name: "index_entries_on_feed_id", using: :btree

  create_table "feeds", force: true do |t|
    t.string   "title"
    t.string   "site"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "prevupdate", default: '1900-01-01 00:00:00'
  end

  add_index "feeds", ["user_id"], name: "index_feeds_on_user_id", using: :btree

  create_table "topstories", force: true do |t|
    t.integer  "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topstories", ["entry_id"], name: "index_topstories_on_entry_id", using: :btree

  create_table "userfeeds", force: true do |t|
    t.integer  "user_id"
    t.integer  "feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "userfeeds", ["feed_id"], name: "index_userfeeds_on_feed_id", using: :btree
  add_index "userfeeds", ["user_id"], name: "index_userfeeds_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
    t.datetime "lastvisit",       default: '1900-01-01 00:00:00'
  end

end
