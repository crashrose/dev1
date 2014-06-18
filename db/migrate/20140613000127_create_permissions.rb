class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :action
      t.integer :organization_id
      t.string :subject_class
      t.integer :subject_id
      t.string :action_scope

      t.timestamps
    end
  end
end
