class CreateUploadGroups < ActiveRecord::Migration
  def change
    create_table :upload_groups do |t|
      t.integer :upload_id
      t.integer :group_id

      t.timestamps
    end
  end
end
