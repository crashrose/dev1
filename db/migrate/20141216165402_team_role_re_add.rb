class TeamRoleReAdd < ActiveRecord::Migration
  def change
  	add_column :positions, :team_role_id, :integer, index: true
  	add_column :sport_platoons, :parent_id, :integer, index: true
  	remove_column :sport_platoons, :team_role_id, :integer
  	add_column :sport_platoons, :is_full_squad, :boolean, index: true
  end
end
