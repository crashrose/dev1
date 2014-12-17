class CreateSportPlatoons < ActiveRecord::Migration
  def change
    create_table :sport_platoons do |t|
      t.string :name
      t.integer :team_role_id
      t.integer :sport_id
      t.integer :required_players

      t.timestamps
    end
    add_index :sport_platoons, :team_role_id
    add_index :sport_platoons, :sport_id
    add_index :sport_platoons, :required_players

    rename_column :lineup_formations, :platoon_id, :lineup_platoon_id
    rename_column :formations, :team_role_id, :sport_platoon_id
    rename_column :platoons, :team_role_id, :sport_platoon_id
    rename_column :positions, :team_role_id, :sport_platoon_id

    rename_table :platoons, :lineup_platoons
  end
end
