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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130120193300) do

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.string   "login"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "author_id"
    t.integer  "lesson_plan_id"
    t.string   "value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "lesson_plans", :force => true do |t|
    t.string   "name"
    t.string   "subject"
    t.string   "description"
    t.integer  "author_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ratings", :force => true do |t|
    t.integer  "lesson_plan_id"
    t.integer  "author_id"
    t.integer  "rating"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "lesson_plan_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
