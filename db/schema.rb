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

ActiveRecord::Schema.define(version: 20160225205715) do

  create_table "classrooms", force: :cascade do |t|
    t.integer  "passcode"
    t.string   "classroom_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "teacher_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["user_id"], name: "comments_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.string   "title"
    t.integer  "teacher_id"
    t.integer  "classroom_id"
    t.text     "text"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "type"
  end

  add_index "messages", ["classroom_id"], name: "messages_on_classroom_id"
  add_index "messages", ["teacher_id"], name: "messages_on_teacher_id"

  create_table "parent_memberships", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "classroom_id"
  end

  create_table "student_memberships", force: :cascade do |t|
    t.integer "student_id"
    t.integer "classroom_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
