class EventMti < ActiveRecord::Migration
  def change
  	add_column :event_types, :event_class, :string, index: true
  	add_column :event_types, :sports_id, :integer, index: true
  	add_column :events, :event_types, :integer, index: true
  end
end
