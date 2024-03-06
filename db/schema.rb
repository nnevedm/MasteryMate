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

ActiveRecord::Schema[7.1].define(version: 2024_03_06_135252) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expert_fields", force: :cascade do |t|
    t.bigint "expert_id", null: false
    t.bigint "field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expert_id"], name: "index_expert_fields_on_expert_id"
    t.index ["field_id"], name: "index_expert_fields_on_field_id"
  end

  create_table "experts", force: :cascade do |t|
    t.text "description"
    t.integer "price_per_hour"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_experts_on_user_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "expertise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.text "content"
    t.date "occurs_on"
    t.integer "time"
    t.integer "extra_costs"
    t.integer "reduction"
    t.bigint "request_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Pending"
    t.index ["request_id"], name: "index_offers_on_request_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "estimated_time"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "expert_id"
    t.string "status", default: "Pending"
    t.index ["expert_id"], name: "index_requests_on_expert_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "expert_id", null: false
    t.index ["expert_id"], name: "index_reviews_on_expert_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "expert_fields", "experts"
  add_foreign_key "expert_fields", "fields"
  add_foreign_key "experts", "users"
  add_foreign_key "offers", "requests"
  add_foreign_key "requests", "experts"
  add_foreign_key "requests", "users"
  add_foreign_key "reviews", "experts"
  add_foreign_key "reviews", "users"
end
