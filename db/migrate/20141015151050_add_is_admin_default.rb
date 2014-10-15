class AddIsAdminDefault < ActiveRecord::Migration
  def change
  	change_column :organization_users, :is_admin, :boolean, default: false
  end
end
