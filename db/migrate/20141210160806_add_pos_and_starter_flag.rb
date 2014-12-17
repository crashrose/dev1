class AddPosAndStarterFlag < ActiveRecord::Migration
  def change
  	add_column :lineup_players, :pos_rank, :integer, index: true
  	add_column :lineup_players, :is_starter, :boolean, index: true
  end
end
