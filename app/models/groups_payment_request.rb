class GroupsPaymentRequest < ActiveRecord::Base


	belongs_to :group
	belongs_to :payment_request
	
end
