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

ActiveRecord::Schema.define(:version => 20120125064325) do

  create_table "applications", :force => true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "phone_number"
    t.text     "answer1"
    t.text     "answer2"
    t.text     "answer3"
  end

  add_index "applications", ["user_id", "created_at"], :name => "index_applications_on_user_id_and_created_at"

  create_table "interest_checkers", :force => true do |t|
    t.integer  "interest_id"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interest_checkers", ["interest_id", "application_id"], :name => "index_interest_checkers_on_interest_id_and_application_id"

  create_table "interests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interests", ["name"], :name => "index_interests_on_name", :unique => true

  create_table "jobs", :force => true do |t|
    t.integer  "application_id"
    t.string   "organization"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "responsibilities"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["application_id"], :name => "index_jobs_on_application_id"

  create_table "schools", :force => true do |t|
    t.string   "school_type"
    t.string   "name"
    t.string   "major"
    t.string   "degree"
    t.date     "date_recieved"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["application_id"], :name => "index_schools_on_application_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
