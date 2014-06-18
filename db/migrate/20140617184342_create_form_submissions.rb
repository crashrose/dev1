class CreateFormSubmissions < ActiveRecord::Migration
  def change
    create_table :form_submissions do |t|
      t.integer :user_id
      t.integer :form_id

      t.timestamps
    end
  end
end
