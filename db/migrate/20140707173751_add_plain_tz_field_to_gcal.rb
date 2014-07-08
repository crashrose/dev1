class AddPlainTzFieldToGcal < ActiveRecord::Migration
  def change
  	  	change_table :g_cals do |t|
		t.string :timezone
    end
  end
end
