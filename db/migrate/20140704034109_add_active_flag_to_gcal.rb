class AddActiveFlagToGcal < ActiveRecord::Migration
  def change
  	change_table :g_cals do |t|
		t.boolean :active
    end
  end
end
