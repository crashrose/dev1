class StreamlineStats < ActiveRecord::Migration
  def change
  	add_column :stat_lines, :is_calc_only, :boolean, index: true
  	add_column :stat_lines, :category, :string
  	rename_column :stat_line_item_entries, :stat_line_entry_unit_id, :stat_line_entry_id
  end
end
