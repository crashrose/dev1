class AddStartingFlag < ActiveRecord::Migration
  def change
  	add_column :platoons, :starting_lineup_formation_id, :integer, index: true
  end
end
