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

ActiveRecord::Schema.define(version: 2019_08_29_140634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "answers", force: :cascade do |t|
    t.string "description"
    t.boolean "correct", default: false, null: false
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "epic_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "epic_lists_epics", id: false, force: :cascade do |t|
    t.bigint "epic_list_id", null: false
    t.bigint "epic_id", null: false
    t.index ["epic_id", "epic_list_id"], name: "index_epic_lists_epics_on_epic_id_and_epic_list_id"
    t.index ["epic_list_id", "epic_id"], name: "index_epic_lists_epics_on_epic_list_id_and_epic_id"
  end

  create_table "epics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hidden", default: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "epic_id"
    t.index ["epic_id"], name: "index_questions_on_epic_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.bigint "epic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["epic_id"], name: "index_tasks_on_epic_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "answer_id"
    t.boolean "response", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_user_answers_on_answer_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
  end

  create_table "user_tasks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "task_id"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_user_tasks_on_task_id"
    t.index ["user_id"], name: "index_user_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "questions", "epics"
  add_foreign_key "tasks", "epics"
  add_foreign_key "user_answers", "answers"
  add_foreign_key "user_answers", "users"
  add_foreign_key "user_tasks", "tasks"
  add_foreign_key "user_tasks", "users"
end
