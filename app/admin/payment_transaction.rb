ActiveAdmin.register PaymentTransaction  do
	navigation_menu :configure

	index do
		column :person
		column :payment_request, sortable: false
		column :amount, sortable: false
		column :status, sortable: false
		actions
	end
end