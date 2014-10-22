class CreateOtherEvents < ActiveRecord::Migration
  def change
    create_table :other_events do |t|
      t.integer :event_id
      t.integer :event_type_id

      t.timestamps
    end
  end
end
