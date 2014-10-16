class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title
      t.string :abbreviation, limit: 10
      t.integer :role_id, index: true
      t.integer :parent_id, index: true
      t.integer :sport_id, index: true
      t.integer :order_pos

      t.timestamps
    end
  end
end
