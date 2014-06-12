class ChangeEventUserToOwner < ActiveRecord::Migration
  def change
  	rename_column :events, :user_id, :owner
  end
end
