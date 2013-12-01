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

ActiveRecord::Schema.define(version: 20131201201535) do

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", force: true do |t|
    t.text     "description"
    t.integer  "resolved",    default: 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.boolean  "anonymous",   default: false
    t.integer  "course_id"
    t.boolean  "archived",    default: false
  end

  add_index "issues", ["course_id"], name: "index_issues_on_course_id"
  add_index "issues", ["user_id"], name: "index_issues_on_user_id"

  create_table "responses", force: true do |t|
    t.text     "description"
    t.integer  "issue_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["issue_id"], name: "index_responses_on_issue_id"
  add_index "responses", ["user_id"], name: "index_responses_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "permissions",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "github_name"
    t.string   "provider"
    t.string   "email"
    t.string   "image_gravatar"
  end

end
