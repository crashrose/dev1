class CreateStatLines < ActiveRecord::Migration
  def change
    create_table :stat_lines do |t|
      t.string :title
      t.string :unit_type

      t.timestamps
    end
  end
end
