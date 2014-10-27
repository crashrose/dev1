class AddingIdToUnits < ActiveRecord::Migration
  def change
  	add_column :stat_line_units, :unit_id, :integer, index: true
  end
end
