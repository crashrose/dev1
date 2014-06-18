class CreateFormSubmissionItems < ActiveRecord::Migration
  def change
    create_table :form_submission_items do |t|
      t.integer :form_submission_id
      t.integer :form_field_id
      t.string :form_field_value

      t.timestamps
    end
  end
end
