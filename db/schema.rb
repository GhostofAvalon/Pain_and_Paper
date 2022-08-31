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

ActiveRecord::Schema[7.0].define(version: 2022_08_29_133736) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backgrounds", force: :cascade do |t|
    t.string "name"
    t.string "specificity"
    t.text "story"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "character_equipments", force: :cascade do |t|
    t.bigint "equipment_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_equipments_on_character_id"
    t.index ["equipment_id"], name: "index_character_equipments_on_equipment_id"
  end

  create_table "character_gifts", force: :cascade do |t|
    t.bigint "gift_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_gifts_on_character_id"
    t.index ["gift_id"], name: "index_character_gifts_on_gift_id"
  end

  create_table "character_skills", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_skills_on_character_id"
    t.index ["skill_id"], name: "index_character_skills_on_skill_id"
  end

  create_table "character_spells", force: :cascade do |t|
    t.bigint "spell_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_spells_on_character_id"
    t.index ["spell_id"], name: "index_character_spells_on_spell_id"
  end

  create_table "characteristics_lists", force: :cascade do |t|
    t.integer "force_value"
    t.integer "dexterity_value"
    t.integer "constitution_value"
    t.integer "intelligence_value"
    t.integer "charisma_value"
    t.integer "wisdom_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name" # To do
    t.float "height" # To do
    t.integer "level" # To do
    t.text "description" # To do
    t.integer "age" # To do
    t.float "weight" # To do
    t.string "gender" # To do
    t.bigint "user_id", null: false
    t.bigint "race_id", null: false # To do
    t.bigint "job_id", null: false # To do / class
    t.bigint "room_id", null: false
    t.bigint "characteristics_list_id", null: false # To do
    t.bigint "background_id", null: false # To do
    t.string "image_url" # To do
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["background_id"], name: "index_characters_on_background_id"
    t.index ["characteristics_list_id"], name: "index_characters_on_characteristics_list_id"
    t.index ["job_id"], name: "index_characters_on_job_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
    t.index ["room_id"], name: "index_characters_on_room_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "status", default: false
    t.string "image_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "character_equipments", "characters"
  add_foreign_key "character_equipments", "equipment"
  add_foreign_key "character_gifts", "characters"
  add_foreign_key "character_gifts", "gifts"
  add_foreign_key "character_skills", "characters"
  add_foreign_key "character_skills", "skills"
  add_foreign_key "character_spells", "characters"
  add_foreign_key "character_spells", "spells"
  add_foreign_key "characters", "backgrounds"
  add_foreign_key "characters", "characteristics_lists"
  add_foreign_key "characters", "jobs"
  add_foreign_key "characters", "races"
  add_foreign_key "characters", "rooms"
  add_foreign_key "characters", "users"
  add_foreign_key "rooms", "users"
end
