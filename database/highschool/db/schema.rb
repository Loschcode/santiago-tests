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

ActiveRecord::Schema.define(version: 20160403221005) do

  create_table "course_tests", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_tests", ["course_id"], name: "index_course_tests_on_course_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.integer  "teacher_id", limit: 4
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["teacher_id"], name: "index_courses_on_teacher_id", using: :btree

  create_table "student_course_tests", force: :cascade do |t|
    t.integer  "course_test_id", limit: 4
    t.integer  "student_id",     limit: 4
    t.float    "grade",          limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_course_tests", ["course_test_id"], name: "index_student_course_tests_on_course_test_id", using: :btree
  add_index "student_course_tests", ["grade"], name: "index_student_course_tests_on_grade", using: :btree
  add_index "student_course_tests", ["student_id"], name: "index_student_course_tests_on_student_id", using: :btree

  create_table "student_courses", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "course_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_courses", ["course_id"], name: "index_student_courses_on_course_id", using: :btree
  add_index "student_courses", ["student_id"], name: "index_student_courses_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
