class ChangePeopleFieldsToString < ActiveRecord::Migration
  def change
   change_column :people, :first_name, :string
   change_column :people, :last_name, :string
  end
end
