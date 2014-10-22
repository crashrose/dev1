class CreateStatLineItems < ActiveRecord::Migration
  def change
    create_table :stat_line_items do |t|
      t.string :title
      t.string :abbreviation
      t.integer :stat_line_id, index: true
      t.integer :order_pos, index: true
      t.boolean :is_calc
      t.string :calculation
      t.string :agg_calculation

      t.timestamps
    end
  end
end
