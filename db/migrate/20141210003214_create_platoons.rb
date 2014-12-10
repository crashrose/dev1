class CreatePlatoons < ActiveRecord::Migration
  def change
    create_table :platoons do |t|
      t.integer :team_role_id
      t.integer :competition_id

      t.timestamps
    end
    add_index :platoons, :team_role_id
    add_index :platoons, :competition_id
  end
end
