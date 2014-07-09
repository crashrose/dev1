class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :name
      t.integer :owner_id
      t.decimal :amount, precision: 10, scale: 2
      t.integer :organization_id
      t.text :description
      t.integer :position
      t.string :status

      t.timestamps
    end
  end
end
