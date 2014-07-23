class PaymentNotification < ActiveRecord::Base

	has_one :user
	belongs_to :payment
	has_one :organization, :through => :payment

	serialize :params
	# after_create :mark_cart_as_purchased
 
# private
#   def mark_cart_as_purchased
#     if status == "Completed"
#       cart.update_attributes(:purchased_at => Time.now)
#     end
#   end

end
