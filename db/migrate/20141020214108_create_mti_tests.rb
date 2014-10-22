class CreateMtiTests < ActiveRecord::Migration
  def change
  	rename_column :events, :eventable_id, :as_event_id
  	rename_column :events, :eventable_type, :as_event_type
  end
end
