class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :event_id
      t.string :notes

      t.timestamps
    end
  end
end
