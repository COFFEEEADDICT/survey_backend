# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_12_184321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "question_types", force: :cascade do |t|
    t.string "type"
    t.bigint "question_id", null: false
    t.bigint "survey_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_question_types_on_question_id"
    t.index ["survey_id"], name: "index_question_types_on_survey_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "respondents", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.bigint "survey_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["survey_id"], name: "index_respondents_on_survey_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "answer"
    t.bigint "respondent_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_responses_on_question_id"
    t.index ["respondent_id"], name: "index_responses_on_respondent_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "surname"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "question_types", "questions"
  add_foreign_key "question_types", "surveys"
  add_foreign_key "respondents", "surveys"
  add_foreign_key "responses", "questions"
  add_foreign_key "responses", "respondents"
  add_foreign_key "surveys", "users"
end
