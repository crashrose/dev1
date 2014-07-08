class CreateGcals < ActiveRecord::Migration
  def change
    create_table :gcals do |t|
      t.integer :organization_id
      t.string :gcal_id

      t.timestamps
    end
  end
end
