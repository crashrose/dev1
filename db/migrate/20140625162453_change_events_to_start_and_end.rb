class ChangeEventsToStartAndEnd < ActiveRecord::Migration
  def change
  	rename_column :events, :event_dt, :start_at
  	    change_table :events do |t|

      t.datetime :end_at
    end
  end
end
