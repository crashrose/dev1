class AddPeopleToUsers < ActiveRecord::Migration
  def change
  	change_table(:users) do |t|
  		t.integer :person_id
  	end
  end
end
