class Change < ActiveRecord::Migration
  def change
  	# rename_column :event_users, :event_user, :id
  	rename_column :responses, :event_user, :event_user_id
  end
end
