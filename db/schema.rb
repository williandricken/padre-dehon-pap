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

ActiveRecord::Schema.define(version: 20170129230445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "complement"
    t.integer  "street_number"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "behaviors", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "disease_medic_infos", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "disease_id"
    t.integer  "medic_info_id"
  end

  add_index "disease_medic_infos", ["disease_id"], name: "index_disease_medic_infos_on_disease_id", using: :btree
  add_index "disease_medic_infos", ["medic_info_id"], name: "index_disease_medic_infos_on_medic_info_id", using: :btree

  create_table "diseases", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_grades", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "grade_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employee_grades", ["employee_id"], name: "index_employee_grades_on_employee_id", using: :btree
  add_index "employee_grades", ["grade_id"], name: "index_employee_grades_on_grade_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "schooling"
    t.string   "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "employees", ["user_id"], name: "index_employees_on_user_id", using: :btree

  create_table "grades", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medic_infos", force: :cascade do |t|
    t.string   "surgery",    default: "Não"
    t.string   "treatment",  default: "Não"
    t.string   "allergic",   default: "Não"
    t.string   "intolerant", default: "Não"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "student_id"
  end

  add_index "medic_infos", ["student_id"], name: "index_medic_infos_on_student_id", using: :btree

  create_table "responsibles", force: :cascade do |t|
    t.string   "name"
    t.string   "rg"
    t.string   "cpf"
    t.string   "schooling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "responsibles", ["user_id"], name: "index_responsibles_on_user_id", using: :btree

  create_table "student_behaviors", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "student_id"
    t.integer  "behavior_id"
  end

  add_index "student_behaviors", ["behavior_id"], name: "index_student_behaviors_on_behavior_id", using: :btree
  add_index "student_behaviors", ["student_id"], name: "index_student_behaviors_on_student_id", using: :btree

  create_table "student_grades", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "student_grades", ["grade_id"], name: "index_student_grades_on_grade_id", using: :btree
  add_index "student_grades", ["student_id"], name: "index_student_grades_on_student_id", using: :btree

  create_table "student_responsibles", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "student_id"
    t.integer  "responsible_id"
  end

  add_index "student_responsibles", ["responsible_id"], name: "index_student_responsibles_on_responsible_id", using: :btree
  add_index "student_responsibles", ["student_id"], name: "index_student_responsibles_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "birth_date"
    t.string   "place_of_birth"
    t.integer  "school_year"
    t.string   "start_date"
    t.string   "another_behavior"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "state",            limit: 2
  end

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "disease_medic_infos", "diseases"
  add_foreign_key "disease_medic_infos", "medic_infos"
  add_foreign_key "employee_grades", "employees"
  add_foreign_key "employee_grades", "grades"
  add_foreign_key "employees", "users"
  add_foreign_key "medic_infos", "students"
  add_foreign_key "responsibles", "users"
  add_foreign_key "student_behaviors", "behaviors"
  add_foreign_key "student_behaviors", "students"
  add_foreign_key "student_grades", "grades"
  add_foreign_key "student_grades", "students"
  add_foreign_key "student_responsibles", "responsibles"
  add_foreign_key "student_responsibles", "students"
end
