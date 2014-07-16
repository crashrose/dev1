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

ActiveRecord::Schema.define(version: 20140716184356) do

  create_table "event_groups", force: true do |t|
    t.integer  "event_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["event_id"], :name => "index_event_groups_on_event_id"
    t.index ["group_id"], :name => "index_event_groups_on_group_id"
    t.index ["id"], :name => "index_event_groups_on_id"
  end

  create_table "event_types", force: true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.index ["id"], :name => "index_event_types_on_id"
  end

  create_table "groups_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_id"], :name => "index_groups_users_on_group_id"
    t.index ["id"], :name => "index_groups_users_on_id"
    t.index ["user_id"], :name => "index_groups_users_on_user_id"
  end

  create_view "event_users", "select distinct `event_groups`.`event_id` AS `event_id`,`groups_users`.`user_id` AS `user_id`,concat(`event_groups`.`event_id`,'_',`groups_users`.`user_id`) AS `id` from (`event_groups` join `groups_users` on((`groups_users`.`group_id` = `event_groups`.`group_id`)))", :force => true
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
    t.index ["event_type_id"], :name => "index_events_on_event_type_id"
    t.index ["g_cal_event_id"], :name => "index_events_on_g_cal_event_id"
    t.index ["g_cal_id"], :name => "index_events_on_g_cal_id"
    t.index ["id"], :name => "index_events_on_id"
    t.index ["location_id"], :name => "index_events_on_location_id"
    t.index ["organization_id"], :name => "index_events_on_organization_id"
    t.index ["owner_id"], :name => "index_events_on_owner_id"
  end

  create_table "file_types", force: true do |t|
    t.string   "name"
    t.string   "mime_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id"], :name => "index_file_types_on_id"
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
    t.index ["form_id"], :name => "index_form_fields_on_form_id"
    t.index ["id"], :name => "index_form_fields_on_id"
  end

  create_table "form_submission_items", force: true do |t|
    t.integer  "form_submission_id"
    t.integer  "form_field_id"
    t.string   "form_field_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["form_field_id"], :name => "index_form_submission_items_on_form_field_id"
    t.index ["form_submission_id"], :name => "index_form_submission_items_on_form_submission_id"
    t.index ["id"], :name => "index_form_submission_items_on_id"
  end

  create_table "form_submissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["form_id"], :name => "index_form_submissions_on_form_id"
    t.index ["id"], :name => "index_form_submissions_on_id"
    t.index ["user_id"], :name => "index_form_submissions_on_user_id"
  end

  create_table "forms", force: true do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.boolean  "publish_results"
    t.boolean  "email_results"
    t.string   "email_to_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id"], :name => "index_forms_on_id"
    t.index ["organization_id"], :name => "index_forms_on_organization_id"
  end

  create_table "g_cals", force: true do |t|
    t.integer  "organization_id"
    t.string   "g_cal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "timezone_id"
    t.boolean  "active"
    t.string   "timezone"
    t.index ["g_cal_id"], :name => "index_g_cals_on_g_cal_id"
    t.index ["id"], :name => "index_g_cals_on_id"
    t.index ["organization_id"], :name => "index_g_cals_on_organization_id"
  end

  create_table "group_permissions", force: true do |t|
    t.integer  "group_id"
    t.integer  "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_id"], :name => "index_group_permissions_on_group_id"
    t.index ["id"], :name => "index_group_permissions_on_id"
    t.index ["permission_id"], :name => "index_group_permissions_on_permission_id"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.index ["id"], :name => "index_groups_on_id"
    t.index ["organization_id"], :name => "index_groups_on_organization_id"
  end

  create_table "groups_payments", force: true do |t|
    t.integer "group_id"
    t.integer "payment_id"
    t.index ["group_id"], :name => "index_groups_payments_on_group_id"
    t.index ["id"], :name => "index_groups_payments_on_id"
    t.index ["payment_id"], :name => "index_groups_payments_on_payment_id"
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
    t.index ["id"], :name => "index_locations_on_id"
    t.index ["organization_id"], :name => "index_locations_on_organization_id"
  end

  create_table "org_types", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id"], :name => "index_org_types_on_id"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.integer  "org_type_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "paypal_seller_id"
    t.index ["id"], :name => "index_organizations_on_id"
    t.index ["org_type_id"], :name => "index_organizations_on_org_type_id"
    t.index ["owner_id"], :name => "index_organizations_on_owner_id"
    t.index ["parent_id"], :name => "index_organizations_on_parent_id"
    t.index ["paypal_seller_id"], :name => "index_organizations_on_paypal_seller_id"
  end

  create_table "payment_notifications", force: true do |t|
    t.text     "params"
    t.string   "status"
    t.string   "transaction_id"
    t.integer  "user_id"
    t.integer  "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id"], :name => "index_payment_notifications_on_id"
    t.index ["payment_id"], :name => "index_payment_notifications_on_payment_id"
    t.index ["transaction_id"], :name => "index_payment_notifications_on_transaction_id"
    t.index ["user_id"], :name => "index_payment_notifications_on_user_id"
  end

  create_table "payments", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.decimal  "amount",          precision: 10, scale: 2
    t.integer  "organization_id"
    t.text     "description"
    t.integer  "position"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id"], :name => "index_payments_on_id"
    t.index ["organization_id"], :name => "index_payments_on_organization_id"
    t.index ["owner_id"], :name => "index_payments_on_owner_id"
  end

  create_view "payments_users", "select distinct `groups_payments`.`payment_id` AS `payment_id`,`groups_users`.`user_id` AS `user_id`,concat(`groups_payments`.`payment_id`,'_',`groups_users`.`user_id`) AS `id` from (`groups_payments` join `groups_users` on((`groups_users`.`group_id` = `groups_payments`.`group_id`)))", :force => true
  create_table "people", force: true do |t|
    t.integer  "user_id",    default: 0
    t.string   "first_name",             null: false
    t.string   "last_name"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id"], :name => "index_people_on_id"
    t.index ["user_id"], :name => "index_people_on_user_id"
  end

  create_table "permissions", force: true do |t|
    t.string   "action"
    t.integer  "organization_id"
    t.string   "subject_class"
    t.integer  "subject_id"
    t.string   "action_scope"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["action"], :name => "index_permissions_on_action"
    t.index ["action_scope"], :name => "index_permissions_on_action_scope"
    t.index ["id"], :name => "index_permissions_on_id"
    t.index ["organization_id"], :name => "index_permissions_on_organization_id"
    t.index ["subject_class"], :name => "index_permissions_on_subject_class"
  end

  create_table "response_reasons", force: true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.index ["id"], :name => "index_response_reasons_on_id"
    t.index ["organization_id"], :name => "index_response_reasons_on_organization_id"
  end

  create_table "response_statuses", force: true do |t|
    t.string   "title"
    t.string   "text"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id"], :name => "index_response_statuses_on_id"
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
    t.index ["event_id"], :name => "index_responses_on_event_id"
    t.index ["id"], :name => "index_responses_on_id"
    t.index ["response_reason_id"], :name => "index_responses_on_response_reason_id"
    t.index ["response_status_id"], :name => "index_responses_on_response_status_id"
    t.index ["review_status_id"], :name => "index_responses_on_review_status_id"
    t.index ["reviewed_user_id"], :name => "index_responses_on_reviewed_user_id"
    t.index ["user_id"], :name => "index_responses_on_user_id"
  end

  create_table "review_statuses", force: true do |t|
    t.string   "title"
    t.string   "text"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id"], :name => "index_review_statuses_on_id"
  end

  create_table "upload_groups", force: true do |t|
    t.integer  "upload_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_id"], :name => "index_upload_groups_on_group_id"
    t.index ["id"], :name => "index_upload_groups_on_id"
    t.index ["upload_id"], :name => "index_upload_groups_on_upload_id"
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
    t.index ["file_type_id"], :name => "index_uploads_on_file_type_id"
    t.index ["id"], :name => "index_uploads_on_id"
    t.index ["organization_id"], :name => "index_uploads_on_organization_id"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
    t.index ["email"], :name => "index_users_on_email", :unique => true
    t.index ["id"], :name => "index_users_on_id"
    t.index ["person_id"], :name => "index_users_on_person_id"
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
    t.index ["uid"], :name => "index_users_on_uid"
    t.index ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  end

end
