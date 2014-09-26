class PaymentRequest < ActiveRecord::Base

	belongs_to :organization
	belongs_to :owner, class_name: "Person", primary_key: "user_id"
	has_and_belongs_to_many :groups

	attr_accessor :paypal_seller_id

	require 'json'

	acts_as_list

	def return_url
		@return_url = Rails.application.routes.url_helpers.payment_requests_url
	end

	def notify_url
		@notify_url = Rails.application.routes.url_helpers.process_ipn_url
	end

	def paypal_seller_id
		@paypal_seller_id = self.organization.paypal_seller_id
	end

	def paypal_custom_code(user_id)
		@paypal_custom_code = {:user_id => user_id,
							:org_id => 2,
							# :org_id => self.organization_id,
							:payment_request_id => self.id
							}.to_json
	end

	private
	def default_values
		self.position = EventType.all.maximum(:position) +1
		self.status = 'open'
	end

end
