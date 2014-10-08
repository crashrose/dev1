class AddOrgToInvite < ActiveRecord::Migration
  def change
  	add_column :invitations, :organization_id, :integer
  end
end
