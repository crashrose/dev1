class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :user_id, default: 0
      t.text :first_name, null: false
      t.text :last_name
      t.text :note

      t.timestamps
    end
  end
end
