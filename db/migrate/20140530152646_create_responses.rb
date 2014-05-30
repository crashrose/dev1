class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :response_reason_id
      t.integer :response_status_id
      t.integer :event_id
      t.integer :user_id
      t.string :details
      t.integer :review_status_id
      t.datetime :date_reviewed
      t.integer :reviewed_user_id
      t.boolean :active
      t.string :event_user
      t.integer :updated_by

      t.timestamps
    end
  end
end
