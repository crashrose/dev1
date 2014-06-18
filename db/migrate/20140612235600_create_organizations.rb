class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :owner_id
      t.integer :org_type_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
