class DeviseInvitableAddToUsers < ActiveRecord::Migration
  def change
    add_column :invitations, :recipient_id, :integer
    add_column :invitations, :sender_id, :integer
    rename_column :invitations, :code, :token
    rename_column :invitations, :email_address, :email
  end
end
