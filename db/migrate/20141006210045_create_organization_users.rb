class CreateOrganizationUsers < ActiveRecord::Migration
  def change
    create_table :organization_users do |t|
      t.integer :user_id
      t.integer :organization_id
      t.boolean :is_admin
      t.string :auth_code
      t.string :auth_status

      t.timestamps
    end
  end
end
