class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :event_dt
      t.integer :event_type_id
      t.integer :location_id
      t.integer :user_id
      t.datetime :respond_by

      t.timestamps
    end
  end
end
