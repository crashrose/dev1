class CreateStatTeams < ActiveRecord::Migration
  def change
    create_table :stat_teams do |t|
      t.integer :unit_id

      t.timestamps
    end
  end
end
