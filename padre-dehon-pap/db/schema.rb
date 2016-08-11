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

ActiveRecord::Schema.define(version: 20160808224613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "behaviors", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "disease_medic_infos", force: :cascade do |t|
    t.integer  "disease_id"
    t.integer  "medic_info_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "disease_medic_infos", ["disease_id"], name: "index_disease_medic_infos_on_disease_id", using: :btree
  add_index "disease_medic_infos", ["medic_info_id"], name: "index_disease_medic_infos_on_medic_info_id", using: :btree

  create_table "diseases", force: :cascade do |t|
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
    t.integer  "student_id"
    t.integer  "behavior_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "student_behaviors", ["behavior_id"], name: "index_student_behaviors_on_behavior_id", using: :btree
  add_index "student_behaviors", ["student_id"], name: "index_student_behaviors_on_student_id", using: :btree

  create_table "student_responsibles", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "responsible_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
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
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
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

  add_foreign_key "medic_infos", "students"
  add_foreign_key "responsibles", "users"
end
