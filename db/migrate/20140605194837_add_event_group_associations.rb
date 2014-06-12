class AddEventGroupAssociations < ActiveRecord::Migration

  def change
  	rename_table :events_groups, :event_groups
  end

end
