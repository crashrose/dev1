class ChangePaymentSchema < ActiveRecord::Migration
  def change

	change_table :payment_notifications do |t|
	  t.string :transaction_type, index: true
	  t.decimal :amount, precision: 5, scale: 2, index: true
	  t.rename :params, :ipn_url
	  t.rename :payment_id, :payment_request_id
	end

	add_column :payments, :due_date, :datetime
	rename_column :groups_payments, :payment_id, :payment_request_id
	rename_table :payments, :payment_requests
	rename_table :payment_notifications, :payment_transactions
	rename_table :groups_payments, :groups_payment_requests
	
  end
end
