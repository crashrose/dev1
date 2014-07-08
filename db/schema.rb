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

ActiveRecord::Schema.define(version: 20140707173751) do

  create_table "event_groups", force: true do |t|
    t.integer  "event_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", force: true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  create_table "event_users", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.string  "id",       limit: 23
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "starts_at"
    t.integer  "event_type_id"
    t.integer  "location_id"
    t.integer  "owner_id"
    t.datetime "respond_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "g_cal_id"
    t.string   "g_cal_event_id"
    t.datetime "ends_at"
    t.boolean  "all_day"
    t.text     "description"
    t.string   "title"
    t.integer  "organization_id"
    t.string   "visibility"
  end

  create_table "file_types", force: true do |t|
    t.string   "name"
    t.string   "mime_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form_fields", force: true do |t|
    t.string   "name"
    t.integer  "form_id"
    t.integer  "max_length"
    t.integer  "min_length"
    t.boolean  "required"
    t.string   "field_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form_submission_items", force: true do |t|
    t.integer  "form_submission_id"
    t.integer  "form_field_id"
    t.string   "form_field_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form_submissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forms", force: true do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.boolean  "publish_results"
    t.boolean  "email_results"
    t.string   "email_to_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fullcalendar_engine_event_series", force: true do |t|
    t.integer  "frequency",  default: 1
    t.string   "period",     default: "monthly"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fullcalendar_engine_events", force: true do |t|
    t.string   "title"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",         default: false
    t.text     "description"
    t.integer  "event_series_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fullcalendar_engine_events", ["event_series_id"], name: "index_fullcalendar_engine_events_on_event_series_id", using: :btree

  create_table "g_cals", force: true do |t|
    t.integer  "organization_id"
    t.string   "g_cal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "timezone_id"
    t.boolean  "active"
    t.string   "timezone"
  end

  create_table "g_events", force: true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_permissions", force: true do |t|
    t.integer  "group_id"
    t.integer  "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  create_table "groups_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "note"
    t.string   "website"
    t.string   "maplink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.string   "visibility"
  end

  create_table "o_auth2_credentials", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "signet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "org_types", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.integer  "org_type_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.integer  "user_id",    default: 0
    t.string   "first_name",             null: false
    t.string   "last_name"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", force: true do |t|
    t.string   "action"
    t.integer  "organization_id"
    t.string   "subject_class"
    t.integer  "subject_id"
    t.string   "action_scope"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "response_reasons", force: true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  create_table "response_statuses", force: true do |t|
    t.string   "title"
    t.string   "text"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.integer  "response_reason_id"
    t.integer  "response_status_id"
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "details"
    t.integer  "review_status_id"
    t.datetime "date_reviewed"
    t.integer  "reviewed_user_id"
    t.boolean  "active"
    t.string   "event_user_id"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "review_statuses", force: true do |t|
    t.string   "title"
    t.string   "text"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tzones", force: true do |t|
    t.string   "name"
    t.string   "tz_info"
    t.integer  "offset_sec"
    t.integer  "offset_min"
    t.decimal  "offset_hour",           precision: 4, scale: 2
    t.string   "sign",        limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "upload_groups", force: true do |t|
    t.integer  "upload_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", force: true do |t|
    t.string   "name"
    t.integer  "file_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.text     "description"
    t.integer  "organization_id"
    t.string   "visibility"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "person_id"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
