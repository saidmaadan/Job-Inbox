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

ActiveRecord::Schema.define(version: 20150115231940) do

  create_table "employers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.text     "about"
    t.string   "state"
    t.string   "city"
    t.string   "zipcode"
    t.string   "country"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "facebook"
    t.string   "website"
    t.string   "heard_us"
    t.string   "company_name"
  end

  create_table "jobs", force: true do |t|
    t.string   "company"
    t.string   "title"
    t.text     "description"
    t.text     "skill"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "industry"
    t.string   "company_size"
    t.string   "website"
    t.text     "key_responsibility"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.string   "salary"
    t.string   "salary_rate"
    t.string   "employment_type"
    t.string   "experience"
    t.string   "relocation"
    t.string   "travel"
    t.text     "other_pay"
    t.text     "job_link"
    t.text     "company_description"
  end

end
