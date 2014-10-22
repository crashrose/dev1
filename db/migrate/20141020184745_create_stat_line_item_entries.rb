class CreateStatLineItemEntries < ActiveRecord::Migration
  def change
    create_table :stat_line_item_entries do |t|
      t.integer :stat_line_item_id, index: true
      t.integer :stat_line_entry_id, index: true
      t.decimal :value

      t.timestamps
    end
  end
end
