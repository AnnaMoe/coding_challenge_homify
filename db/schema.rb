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

ActiveRecord::Schema.define(version: 2021_07_04_201325) do

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.string "tags"
    t.string "estimated_duration"
    t.integer "expert_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expert_id"], name: "index_campaigns_on_expert_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.string "receiver_type"
    t.integer "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receiver_type", "receiver_id"], name: "index_comments_on_receiver_type_and_receiver_id"
  end

  create_table "todos", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "user_id"
    t.index ["campaign_id"], name: "index_todos_on_campaign_id"
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "status"
    t.string "profession"
    t.string "service"
    t.string "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaigns", "users", column: "expert_id"
  add_foreign_key "todos", "campaigns"
  add_foreign_key "todos", "users"
end
