class AddInviteStatusDefault < ActiveRecord::Migration
  def change
  	change_column :invitations, :status, :string, default: 'new'
  end
end
