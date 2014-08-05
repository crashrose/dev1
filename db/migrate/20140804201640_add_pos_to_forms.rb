class AddPosToForms < ActiveRecord::Migration
  def change
  	change_table :forms do |t|
  		t.integer :position
  	end
  	change_table :form_fields do |t|
  		t.integer :position
  	end
  end
end
