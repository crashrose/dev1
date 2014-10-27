class CreateStatLineUnits < ActiveRecord::Migration
  def change
    create_table :stat_line_units do |t|
      t.integer :as_stat_line_unit_id
      t.string :as_stat_line_unit_type

      t.timestamps
    end
  end
end
