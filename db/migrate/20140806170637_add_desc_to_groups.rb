class AddDescToGroups < ActiveRecord::Migration
  def change
  	  	change_table :groups do |t|
  		t.string :description
  	end
  end
end
