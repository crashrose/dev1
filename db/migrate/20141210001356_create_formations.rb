class CreateFormations < ActiveRecord::Migration
  def change
    create_table :formations do |t|
      t.string :name
      t.integer :team_role_id

      t.timestamps
    end
    add_index :formations, :team_role_id
  end
end
