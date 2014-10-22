class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.integer :event_id
      t.string :note
      t.integer :practice_plan_id
      t.integer :campaign_id

      t.timestamps
    end
  end
end
