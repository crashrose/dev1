class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.integer :event_id, index: true
      t.integer :lineup_id, index: true
      t.integer :campaign_id, index: true
      t.boolean :has_stats, index: true
      t.boolean :stats_complete, index: true
      t.integer :opponent_id
      t.integer :uniform_id, index: true
      t.boolean :is_home_game, index: true
      t.integer :transport_plan_id, index: true
      t.datetime :arrival_time, index: true
      t.datetime :start_time
      t.integer :expected_duration
      t.integer :competition_type_id, index: true

      t.timestamps
    end
  end
end
