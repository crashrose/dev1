class CreateStatLineEntryUnits < ActiveRecord::Migration
  def change
    create_table :stat_line_entry_units do |t|
      t.integer :stat_line_entry_id
      t.integer :stat_line_unit_id

      t.timestamps
    end
    remove_column :stat_line_entries, :unit_id
    rename_column :stat_line_item_entries, :stat_line_entry_id, :stat_line_entry_unit_id
  end
end
