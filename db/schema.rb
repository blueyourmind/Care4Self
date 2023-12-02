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

ActiveRecord::Schema[7.1].define(version: 2023_12_01_215210) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "intervals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "value"
  end

  create_table "medication_frequencies", force: :cascade do |t|
    t.bigint "medication_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "reminder_id"
    t.index ["medication_id"], name: "index_medication_frequencies_on_medication_id"
    t.index ["reminder_id"], name: "index_medication_frequencies_on_reminder_id"
  end

  create_table "medications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "interval_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name"
    t.string "instruction"
    t.integer "duration"
    t.integer "quantity"
    t.string "med_type"
    t.datetime "start_date", precision: nil
    t.datetime "end_date", precision: nil
    t.string "frequency"
    t.boolean "reminder_required"
    t.datetime "start_time"
    t.index ["interval_id"], name: "index_medications_on_interval_id"
    t.index ["user_id"], name: "index_medications_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "post"
    t.datetime "scheduled_at"
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "recipients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.bigint "medication_frequency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.datetime "pre_alarm_time", precision: nil
    t.datetime "alarm_time", precision: nil
    t.integer "alarm_duration"
    t.boolean "has_taken", default: false
    t.index ["medication_frequency_id"], name: "index_reminders_on_medication_frequency_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name"
    t.integer "phone_number"
    t.integer "family_phone_number"
    t.string "photo"
    t.string "user_type"
    t.bigint "recipient_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["recipient_id"], name: "index_users_on_recipient_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "medication_frequencies", "medications"
  add_foreign_key "medication_frequencies", "reminders"
  add_foreign_key "medications", "intervals"
  add_foreign_key "medications", "users"
  add_foreign_key "reminders", "medication_frequencies"
  add_foreign_key "users", "recipients"
end
