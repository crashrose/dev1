class CreateFormationPositions < ActiveRecord::Migration
  def change
    create_table :formation_positions do |t|
      t.integer :position_id
      t.integer :formation_id

      t.timestamps
    end
    add_index :formation_positions, :position_id
    add_index :formation_positions, :formation_id
  end
end
