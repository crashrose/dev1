class AddRequiresLineup < ActiveRecord::Migration
  def change
  	rename_column :sport_platoons, :is_full_squad, :requires_lineup
  end
end
