class CreateLineupFormations < ActiveRecord::Migration
  def change
    create_table :lineup_formations do |t|
      t.integer :formation_id
      t.integer :platoon_id

      t.timestamps
    end
    add_index :lineup_formations, :formation_id
    add_index :lineup_formations, :platoon_id
  end
end
