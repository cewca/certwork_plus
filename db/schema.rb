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

ActiveRecord::Schema.define(version: 20150204071951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessment_indicators", force: :cascade do |t|
    t.integer  "assessment_plan_id"
    t.datetime "due_date"
    t.string   "name"
    t.string   "comment"
    t.string   "evidence_option"
    t.string   "status"
    t.string   "evidence_url"
    t.string   "evidence_filename"
    t.string   "obj_key"
  end

  create_table "assessment_plans", force: :cascade do |t|
    t.datetime "created_at"
    t.boolean  "arroved"
    t.integer  "assigned_by_id"
    t.integer  "approved_by_id"
    t.integer  "candidate_id"
  end

  create_table "assessor_candidate_relationships", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "completed_at"
    t.boolean  "complete",     default: false, null: false
    t.boolean  "boolean",      default: false, null: false
    t.integer  "accessor_id"
    t.integer  "candidate_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "subject",                      null: false
    t.string   "body"
    t.boolean  "read",         default: false
    t.boolean  "boolean",      default: false
    t.datetime "created_at",                   null: false
    t.integer  "from_user_id"
    t.integer  "to_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "username",                        null: false
    t.string   "firstname",                       null: false
    t.string   "lastname",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
