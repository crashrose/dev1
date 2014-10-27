class AddIdToEntryUnit < ActiveRecord::Migration
  def change
  	add_column :stat_line_entry_units, :unit_id, :integer, index: true
  	add_column :stat_line_entry_units, :unit_class, :string, index: true
  end
end
