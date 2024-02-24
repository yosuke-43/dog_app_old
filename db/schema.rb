# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_24_130900) do
  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "explain"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.integer "user_id", null: false
    t.integer "dog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "board_image"
    t.index ["dog_id"], name: "index_boards_on_dog_id"
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.integer "user_id", null: false
    t.integer "board_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_comments_on_board_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dog_answer_rerationships", force: :cascade do |t|
    t.integer "dog_id", null: false
    t.integer "answer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_dog_answer_rerationships_on_answer_id"
    t.index ["dog_id", "answer_id"], name: "index_dog_answer_rerationships_on_dog_id_and_answer_id", unique: true
    t.index ["dog_id"], name: "index_dog_answer_rerationships_on_dog_id"
  end

  create_table "dog_countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dog_size_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string "breed", null: false
    t.string "height"
    t.string "weight"
    t.integer "hair_length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dog_size_type_id", null: false
    t.string "dog_image"
    t.integer "dog_country_id"
    t.integer "activity_level"
    t.integer "solitude_tolerance"
    t.integer "care_difficulty"
    t.text "catchphrase"
    t.text "features_sentence"
    t.text "personality_sentence"
    t.text "history_sentence"
    t.text "recommended_for_whom"
    t.integer "display_in_index", default: 0
    t.index ["dog_country_id"], name: "index_dogs_on_dog_country_id"
    t.index ["dog_size_type_id"], name: "index_dogs_on_dog_size_type_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name"
    t.datetime "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "boards", "dogs"
  add_foreign_key "boards", "users"
  add_foreign_key "comments", "boards"
  add_foreign_key "comments", "users"
  add_foreign_key "dog_answer_rerationships", "answers"
  add_foreign_key "dog_answer_rerationships", "dogs"
  add_foreign_key "dogs", "dog_countries"
  add_foreign_key "dogs", "dog_size_types"
end
