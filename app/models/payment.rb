class Payment < ActiveRecord::Base

	belongs_to :organization
	belongs_to :owner, class_name: "Person", primary_key: "user_id"
	has_and_belongs_to_many :groups

	attr_accessor :paypal_seller_id

	def return_url
		@return_url = Rails.application.routes.url_helpers.payments_url
	end

	def notify_url
		@notify_url = Rails.application.routes.url_helpers.payment_notifications_url
	end

	def paypal_seller_id
		@paypal_seller_id = self.organization.paypal_seller_id
	end

	def paypal_custom_code(user_id)
		@paypal_custom_code = {:user_id => user_id,
							:org_id => self.organization_id,
							:payment_id => self.id
							}
	end

	# def paypal_custom_code=(paypal_custom_code)
	# 	@paypal_custom_code
	# end

	# def paypal_seller_id=(paypal_seller_id)
	# 	@paypal_seller_id = paypal_seller_id
	# end


# 	 def paypal_url(org_id, return_url, notify_url)
#     values = {
#       :business => Organization.get_seller_id(org_id),
#       :cmd => 'upload',
#       :upload => 1,
#       :custom => {:user_id => 4, :payment_id => id},
#       :return => return_url,
#       :amount => amount,
#       :item_name => "Payment through TeamRockett: #{name}",
#       :item_number => "tr_payment_#{id}",
#       :shopping_url => return_url,
#       :notify_url => notify_url
# }
    # line_items.each_with_index do |item, index|
    #   values.merge!({
    #     "amount_#{index+1}" => item.unit_price,
    #     "item_name_#{index+1}" => item.product.name,
    #     "item_number_#{index+1}" => item.id,
    #     "quantity_#{index+1}" => item.quantity
    #   })
    # end
  #   "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  # end





end
