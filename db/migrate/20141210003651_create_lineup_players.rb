class CreateLineupPlayers < ActiveRecord::Migration
  def change
    create_table :lineup_players do |t|
      t.integer :lineup_formation_id
      t.integer :formation_position_id
      t.integer :person_id

      t.timestamps
    end
    add_index :lineup_players, :lineup_formation_id
    add_index :lineup_players, :formation_position_id
    add_index :lineup_players, :person_id
  end
end
