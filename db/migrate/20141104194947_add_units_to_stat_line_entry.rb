class AddUnitsToStatLineEntry < ActiveRecord::Migration
  def change
  	add_column :stat_line_entries, :person_id, :integer, index: true
  	add_column :stat_line_entries, :team_id, :integer, index: true
  	add_column :organizations, :sport_id, :integer, index: true
  	add_column :stat_lines, :sport_id, :integer, index: true
  end
end
