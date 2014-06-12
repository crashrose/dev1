class RenameEventGroups < ActiveRecord::Migration
  def change
  	rename_table :event_groups, :events_groups
  end
end
