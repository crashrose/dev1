class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name
      t.integer :organization_id
      t.boolean :publish_results
      t.boolean :email_results
      t.string :email_to_address

      t.timestamps
    end
  end
end
