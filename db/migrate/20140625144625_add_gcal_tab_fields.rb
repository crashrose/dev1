class AddGcalTabFields < ActiveRecord::Migration
  def change
  	    change_table :events do |t|

      t.string :gcal_id
      t.string :gcal_event_id
    end
  end
end
