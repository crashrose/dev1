class SetUpMti < ActiveRecord::Migration
  def change
  	remove_column :events, :event_type_id
  	add_column :events, :eventable_id, :integer
  	add_column :events, :eventable_type, :string, default: 'other_event'
  end
end
