class AddOrgIdsForMultitenant < ActiveRecord::Migration
  def change
	add_column :posts, :organization_id, :integer
	add_column :form_fields, :organization_id, :integer
	add_column :payment_transactions, :organization_id, :integer
	add_column :taggings, :organization_id, :integer
	add_column :tags, :organization_id, :integer
	add_column :active_admin_comments, :organization_id, :integer
	add_column :form_submission_items, :organization_id, :integer
	add_column :form_submissions, :organization_id, :integer
	add_column :response_statuses, :organization_id, :integer
	add_column :responses, :organization_id, :integer
	add_column :review_statuses, :organization_id, :integer
	add_column :groups_payment_requests, :organization_id, :integer
  end
end
