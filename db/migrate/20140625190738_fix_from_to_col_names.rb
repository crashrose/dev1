class FixFromToColNames < ActiveRecord::Migration
  def change
  	  	  	    change_table :events do |t|
      t.text :description
      t.string :title
  end
  rename_column :events, :start_at, :starts_at
  rename_column :events, :end_at, :ends_at
  end
end
