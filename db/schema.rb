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

ActiveRecord::Schema.define(version: 20151215162623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id", using: :btree

  create_table "coursesemesters", force: :cascade do |t|
    t.string   "name"
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "coursesemesters", ["course_id"], name: "index_coursesemesters_on_course_id", using: :btree
  add_index "coursesemesters", ["user_id"], name: "index_coursesemesters_on_user_id", using: :btree

  create_table "coursesessions", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "coursesessions", ["user_id"], name: "index_coursesessions_on_user_id", using: :btree

  create_table "enrolls", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enrolls", ["session_id"], name: "index_enrolls_on_session_id", using: :btree
  add_index "enrolls", ["user_id"], name: "index_enrolls_on_user_id", using: :btree

  create_table "newenrolls", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "newsession_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "newenrolls", ["course_id"], name: "index_newenrolls_on_course_id", using: :btree
  add_index "newenrolls", ["newsession_id"], name: "index_newenrolls_on_newsession_id", using: :btree
  add_index "newenrolls", ["user_id"], name: "index_newenrolls_on_user_id", using: :btree

  create_table "newsessions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semestersubjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "coursesemester_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "semestersubjects", ["coursesemester_id"], name: "index_semestersubjects_on_coursesemester_id", using: :btree
  add_index "semestersubjects", ["user_id"], name: "index_semestersubjects_on_user_id", using: :btree

  create_table "session_courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "session_courses", ["user_id"], name: "index_session_courses_on_user_id", using: :btree

  create_table "sessionenrolls", force: :cascade do |t|
    t.integer  "coursesession_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "sessionenrolls", ["coursesession_id"], name: "index_sessionenrolls_on_coursesession_id", using: :btree
  add_index "sessionenrolls", ["user_id"], name: "index_sessionenrolls_on_user_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "somenothings", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "coursesemester_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "subjects", ["coursesemester_id"], name: "index_subjects_on_coursesemester_id", using: :btree
  add_index "subjects", ["user_id"], name: "index_subjects_on_user_id", using: :btree

  create_table "takes", force: :cascade do |t|
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "takes", ["course_id"], name: "index_takes_on_course_id", using: :btree
  add_index "takes", ["user_id"], name: "index_takes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "courses", "users"
  add_foreign_key "coursesemesters", "courses"
  add_foreign_key "coursesemesters", "users"
  add_foreign_key "coursesessions", "users"
  add_foreign_key "enrolls", "sessions"
  add_foreign_key "enrolls", "users"
  add_foreign_key "newenrolls", "courses"
  add_foreign_key "newenrolls", "newsessions"
  add_foreign_key "newenrolls", "users"
  add_foreign_key "semestersubjects", "coursesemesters"
  add_foreign_key "semestersubjects", "users"
  add_foreign_key "session_courses", "users"
  add_foreign_key "sessionenrolls", "coursesessions"
  add_foreign_key "sessionenrolls", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "subjects", "coursesemesters"
  add_foreign_key "subjects", "users"
  add_foreign_key "takes", "courses"
  add_foreign_key "takes", "users"
end
