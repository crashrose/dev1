class CreateTimezones < ActiveRecord::Migration
  def change
    create_table :tzones do |t|
      t.string :name
      t.string :tz_info
      t.integer :offset_sec
      t.integer :offset_min
      t.decimal :offset_hour, precision: 4, scale: 2
      t.string :sign, limit: 1
      t.timestamps
    end
  end
end
