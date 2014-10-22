class CreateCompetitionTypes < ActiveRecord::Migration
  def change
    create_table :competition_types do |t|
      t.string :title
      t.integer :sport_id, index: true

      t.timestamps
    end
  end
end
