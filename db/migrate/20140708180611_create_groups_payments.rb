class CreateGroupsPayments < ActiveRecord::Migration
  def change
    create_table :groups_payments do |t|
    	t.belongs_to :group
    	t.belongs_to :payment
    end
  end
end
