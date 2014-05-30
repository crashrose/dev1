class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.string :phone
      t.string :note
      t.string :website
      t.string :maplink

      t.timestamps
    end
  end
end
