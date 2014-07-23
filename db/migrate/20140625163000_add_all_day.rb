class AddAllDay < ActiveRecord::Migration
  def change
  	change_table :events do |t|
  		t.boolean :all_day
    end
  end
end
