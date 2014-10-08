class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :organization_user_id
      t.string :status
      t.string :name
      t.string :code
      t.string :email_address
      t.integer :organization_id

      t.timestamps
    end

    remove_column :organization_users, :auth_code
    remove_column :organization_users, :auth_status
  end
end
