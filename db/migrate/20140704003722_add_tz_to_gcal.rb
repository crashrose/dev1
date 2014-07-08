class AddTzToGcal < ActiveRecord::Migration
  def change
  	change_table :g_cals do |t|
		t.integer :timezone_id
    end
  end
end
