class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
