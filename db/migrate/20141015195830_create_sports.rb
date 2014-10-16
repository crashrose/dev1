class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :title
      t.integer :order_pos

      t.timestamps
    end
  end
end
