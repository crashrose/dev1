class AddOrgIds < ActiveRecord::Migration
  def change
	change_table :events do |t|
		t.integer :organization_id
		t.string :visibility
    end
	change_table :event_types do |t|
		t.integer :organization_id
    end
	change_table :groups do |t|
		t.integer :organization_id
    end
	change_table :locations do |t|
		t.integer :organization_id
		t.string :visibility
    end
	change_table :response_reasons do |t|
		t.integer :organization_id
    end
	change_table :uploads do |t|
		t.integer :organization_id
		t.string :visibility
    end
  end
end
