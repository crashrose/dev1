class CmpnUserRoleToType < ActiveRecord::Migration
  def change
  	rename_column :campaign_users, :team_role_id, :team_role_type_id
  end
end
