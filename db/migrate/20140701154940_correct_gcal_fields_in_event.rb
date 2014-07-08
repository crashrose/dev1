class CorrectGcalFieldsInEvent < ActiveRecord::Migration
  def change
	  rename_column :events, :gcal_id, :g_cal_id
	  rename_column :events, :gcal_event_id, :g_cal_event_id
	  rename_column :gcals, :gcal_id, :g_cal_id
	  rename_table :gcals, :g_cals
  end
end
