class SportPlatoonFullTeam < ActiveRecord::Migration
  def change
  	add_column :sport_platoons, :full_platoon_id, :integer, index: true
  end
end
