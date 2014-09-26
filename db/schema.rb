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

ActiveRecord::Schema.define(version: 20140926152253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "event_groups", force: true do |t|
    t.integer  "event_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_groups", ["event_id"], name: "index_event_groups_on_event_id", using: :btree
  add_index "event_groups", ["group_id"], name: "index_event_groups_on_group_id", using: :btree
  add_index "event_groups", ["id"], name: "index_event_groups_on_id", using: :btree

  create_table "event_types", force: true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  add_index "event_types", ["id"], name: "index_event_types_on_id", using: :btree

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

  add_index "events", ["event_type_id"], name: "index_events_on_event_type_id", using: :btree
  add_index "events", ["g_cal_event_id"], name: "index_events_on_g_cal_event_id", using: :btree
  add_index "events", ["g_cal_id"], name: "index_events_on_g_cal_id", using: :btree
  add_index "events", ["id"], name: "index_events_on_id", using: :btree
  add_index "events", ["location_id"], name: "index_events_on_location_id", using: :btree
  add_index "events", ["organization_id"], name: "index_events_on_organization_id", using: :btree
  add_index "events", ["owner_id"], name: "index_events_on_owner_id", using: :btree

  create_table "file_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "file_types", ["id"], name: "index_file_types_on_id", using: :btree

  create_table "form_fields", force: true do |t|
    t.string   "name"
    t.integer  "form_id"
    t.integer  "max_length"
    t.integer  "min_length"
    t.boolean  "required"
    t.string   "field_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "form_fields", ["form_id"], name: "index_form_fields_on_form_id", using: :btree
  add_index "form_fields", ["id"], name: "index_form_fields_on_id", using: :btree

  create_table "form_submission_items", force: true do |t|
    t.integer  "form_submission_id"
    t.integer  "form_field_id"
    t.string   "form_field_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_submission_items", ["form_field_id"], name: "index_form_submission_items_on_form_field_id", using: :btree
  add_index "form_submission_items", ["form_submission_id"], name: "index_form_submission_items_on_form_submission_id", using: :btree
  add_index "form_submission_items", ["id"], name: "index_form_submission_items_on_id", using: :btree

  create_table "form_submissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_submissions", ["form_id"], name: "index_form_submissions_on_form_id", using: :btree
  add_index "form_submissions", ["id"], name: "index_form_submissions_on_id", using: :btree
  add_index "form_submissions", ["user_id"], name: "index_form_submissions_on_user_id", using: :btree

  create_table "forms", force: true do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.boolean  "publish_results"
    t.boolean  "email_results"
    t.string   "email_to_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "forms", ["id"], name: "index_forms_on_id", using: :btree
  add_index "forms", ["organization_id"], name: "index_forms_on_organization_id", using: :btree

  create_table "g_cals", force: true do |t|
    t.integer  "organization_id"
    t.string   "g_cal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "timezone_id"
    t.boolean  "active"
    t.string   "timezone"
  end

  add_index "g_cals", ["g_cal_id"], name: "index_g_cals_on_g_cal_id", using: :btree
  add_index "g_cals", ["id"], name: "index_g_cals_on_id", using: :btree
  add_index "g_cals", ["organization_id"], name: "index_g_cals_on_organization_id", using: :btree

  create_table "group_permissions", force: true do |t|
    t.integer  "group_id"
    t.integer  "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_permissions", ["group_id"], name: "index_group_permissions_on_group_id", using: :btree
  add_index "group_permissions", ["id"], name: "index_group_permissions_on_id", using: :btree
  add_index "group_permissions", ["permission_id"], name: "index_group_permissions_on_permission_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.string   "description"
  end

  add_index "groups", ["id"], name: "index_groups_on_id", using: :btree
  add_index "groups", ["organization_id"], name: "index_groups_on_organization_id", using: :btree

  create_table "groups_payment_requests", force: true do |t|
    t.integer "group_id"
    t.integer "payment_request_id"
  end

  add_index "groups_payment_requests", ["group_id"], name: "index_groups_payment_requests_on_group_id", using: :btree
  add_index "groups_payment_requests", ["id"], name: "index_groups_payment_requests_on_id", using: :btree
  add_index "groups_payment_requests", ["payment_request_id"], name: "index_groups_payment_requests_on_payment_request_id", using: :btree

  create_table "groups_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups_users", ["group_id"], name: "index_groups_users_on_group_id", using: :btree
  add_index "groups_users", ["id"], name: "index_groups_users_on_id", using: :btree
  add_index "groups_users", ["user_id"], name: "index_groups_users_on_user_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "address"
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
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "locations", ["id"], name: "index_locations_on_id", using: :btree
  add_index "locations", ["organization_id"], name: "index_locations_on_organization_id", using: :btree

  create_table "mime_types", force: true do |t|
    t.string   "content_type"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "org_types", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "org_types", ["id"], name: "index_org_types_on_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.integer  "org_type_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "paypal_seller_id"
  end

  add_index "organizations", ["id"], name: "index_organizations_on_id", using: :btree
  add_index "organizations", ["org_type_id"], name: "index_organizations_on_org_type_id", using: :btree
  add_index "organizations", ["owner_id"], name: "index_organizations_on_owner_id", using: :btree
  add_index "organizations", ["parent_id"], name: "index_organizations_on_parent_id", using: :btree
  add_index "organizations", ["paypal_seller_id"], name: "index_organizations_on_paypal_seller_id", using: :btree

  create_table "payment_requests", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.decimal  "amount",          precision: 10, scale: 2
    t.integer  "organization_id"
    t.text     "description"
    t.integer  "position"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "due_date"
  end

  add_index "payment_requests", ["id"], name: "index_payment_requests_on_id", using: :btree
  add_index "payment_requests", ["organization_id"], name: "index_payment_requests_on_organization_id", using: :btree
  add_index "payment_requests", ["owner_id"], name: "index_payment_requests_on_owner_id", using: :btree

  create_table "payment_transactions", force: true do |t|
    t.text     "ipn_url"
    t.string   "status"
    t.string   "transaction_id"
    t.integer  "user_id"
    t.integer  "payment_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "transaction_type"
    t.decimal  "amount",             precision: 5, scale: 2
  end

  add_index "payment_transactions", ["id"], name: "index_payment_transactions_on_id", using: :btree
  add_index "payment_transactions", ["payment_request_id"], name: "index_payment_transactions_on_payment_request_id", using: :btree
  add_index "payment_transactions", ["transaction_id"], name: "index_payment_transactions_on_transaction_id", using: :btree
  add_index "payment_transactions", ["user_id"], name: "index_payment_transactions_on_user_id", using: :btree

  create_table "people", force: true do |t|
    t.integer  "user_id",    default: 0
    t.string   "first_name",             null: false
    t.string   "last_name"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["id"], name: "index_people_on_id", using: :btree
  add_index "people", ["user_id"], name: "index_people_on_user_id", using: :btree

  create_table "permissions", force: true do |t|
    t.string   "action"
    t.integer  "organization_id"
    t.string   "subject_class"
    t.integer  "subject_id"
    t.string   "action_scope"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["action"], name: "index_permissions_on_action", using: :btree
  add_index "permissions", ["action_scope"], name: "index_permissions_on_action_scope", using: :btree
  add_index "permissions", ["id"], name: "index_permissions_on_id", using: :btree
  add_index "permissions", ["organization_id"], name: "index_permissions_on_organization_id", using: :btree
  add_index "permissions", ["subject_class"], name: "index_permissions_on_subject_class", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
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

  add_index "response_reasons", ["id"], name: "index_response_reasons_on_id", using: :btree
  add_index "response_reasons", ["organization_id"], name: "index_response_reasons_on_organization_id", using: :btree

  create_table "response_statuses", force: true do |t|
    t.string   "title"
    t.string   "text"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "response_statuses", ["id"], name: "index_response_statuses_on_id", using: :btree

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

  add_index "responses", ["event_id"], name: "index_responses_on_event_id", using: :btree
  add_index "responses", ["id"], name: "index_responses_on_id", using: :btree
  add_index "responses", ["response_reason_id"], name: "index_responses_on_response_reason_id", using: :btree
  add_index "responses", ["response_status_id"], name: "index_responses_on_response_status_id", using: :btree
  add_index "responses", ["review_status_id"], name: "index_responses_on_review_status_id", using: :btree
  add_index "responses", ["reviewed_user_id"], name: "index_responses_on_reviewed_user_id", using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "review_statuses", force: true do |t|
    t.string   "title"
    t.string   "text"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "review_statuses", ["id"], name: "index_review_statuses_on_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "upload_groups", force: true do |t|
    t.integer  "upload_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "upload_groups", ["group_id"], name: "index_upload_groups_on_group_id", using: :btree
  add_index "upload_groups", ["id"], name: "index_upload_groups_on_id", using: :btree
  add_index "upload_groups", ["upload_id"], name: "index_upload_groups_on_upload_id", using: :btree

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

  add_index "uploads", ["file_type_id"], name: "index_uploads_on_file_type_id", using: :btree
  add_index "uploads", ["id"], name: "index_uploads_on_id", using: :btree
  add_index "uploads", ["organization_id"], name: "index_uploads_on_organization_id", using: :btree

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["id"], name: "index_users_on_id", using: :btree
  add_index "users", ["person_id"], name: "index_users_on_person_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
