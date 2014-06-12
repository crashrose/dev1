class RenameGroupMembers < ActiveRecord::Migration
  def change
  	rename_table :group_members, :groups_users
  end
end
