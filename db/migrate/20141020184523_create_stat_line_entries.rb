class CreateStatLineEntries < ActiveRecord::Migration
  def change
    create_table :stat_line_entries do |t|
      t.integer :stat_line_id, index: true
      t.integer :unit_id, index: true
      t.integer :competition_id, index: true

      t.timestamps
    end
  end
end
