class CreateStatUsers < ActiveRecord::Migration
  def change
    create_table :stat_users do |t|
      t.integer :unit_id

      t.timestamps
    end
  end
end
