class CreateTeamRoleTypes < ActiveRecord::Migration
  def change
    create_table :team_role_types do |t|
      t.string :title

      t.timestamps
    end

    remove_column :positions, :sport_id
    add_column :team_roles, :sport_id, :integer, index: true
    add_column :team_roles, :team_role_type_id, :integer, index: true
    # add_column :positions, :team_role_id, :integer, index: true
  end
end


