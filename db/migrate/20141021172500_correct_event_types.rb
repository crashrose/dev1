class CorrectEventTypes < ActiveRecord::Migration
  def change
  	rename_column :events, :event_types, :event_type_id
  end
end
