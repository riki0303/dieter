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

ActiveRecord::Schema[8.0].define(version: 2025_04_16_122802) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "fitlogs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "weight", precision: 4, scale: 1, null: false, comment: "体重"
    t.decimal "body_fat", precision: 3, scale: 1, comment: "体脂肪率"
    t.decimal "muscle", precision: 4, scale: 1, comment: "筋肉量"
    t.decimal "bmr", precision: 5, scale: 1, comment: "基礎代謝量"
    t.integer "body_age", comment: "体年齢"
    t.text "memo", comment: "メモ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "record_at", comment: "記録日"
    t.index ["user_id", "record_at"], name: "index_fitlogs_on_user_id_and_record_at", unique: true
    t.index ["user_id"], name: "index_fitlogs_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", comment: "名前"
    t.decimal "height", precision: 4, scale: 1, comment: "身長"
    t.decimal "target_weight", precision: 4, scale: 1, comment: "目標体重"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "fitlogs", "users"
  add_foreign_key "profiles", "users"
end
