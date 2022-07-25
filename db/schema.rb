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

ActiveRecord::Schema[7.0].define(version: 2022_07_25_004404) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adopter_accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_adopter_accounts_on_user_id"
  end

  create_table "adopter_profiles", force: :cascade do |t|
    t.bigint "adopter_account_id", null: false
    t.string "city"
    t.string "country"
    t.string "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adopter_account_id"], name: "index_adopter_profiles_on_adopter_account_id"
  end

  create_table "adoptions", force: :cascade do |t|
    t.bigint "dog_id", null: false
    t.bigint "application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_adoptions_on_application_id"
    t.index ["dog_id"], name: "index_adoptions_on_dog_id"
  end

  create_table "applications", force: :cascade do |t|
    t.bigint "dog_id", null: false
    t.bigint "adopter_account_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adopter_account_id"], name: "index_applications_on_adopter_account_id"
    t.index ["dog_id"], name: "index_applications_on_dog_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_dogs_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "organization_id", null: false
    t.index ["organization_id"], name: "index_staff_accounts_on_organization_id"
    t.index ["user_id"], name: "index_staff_accounts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "signup_role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "adopter_accounts", "users"
  add_foreign_key "adopter_profiles", "adopter_accounts"
  add_foreign_key "adoptions", "applications"
  add_foreign_key "adoptions", "dogs"
  add_foreign_key "applications", "adopter_accounts"
  add_foreign_key "applications", "dogs"
  add_foreign_key "dogs", "organizations"
  add_foreign_key "staff_accounts", "organizations"
  add_foreign_key "staff_accounts", "users"
end
