class AddPaypalToOrg < ActiveRecord::Migration
  def change
  	change_table :organizations do |t|
		t.string :paypal_seller_id, foreign_key: false
    end
  end
end
