class GeocodingLocation < ActiveRecord::Migration
  def change
  	rename_column :locations, :address1, :address
  	change_table :locations do |t|
  		t.float :latitude
  		t.float :longitude

  	end
  end
end
