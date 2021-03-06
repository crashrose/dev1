class PaymentTransaction < ActiveRecord::Base

	belongs_to :person, class_name: "Person", primary_key: "user_id", foreign_key: "user_id"
	belongs_to :payment_request
	has_one :organization, :through => :payment_request

  belongs_to :organization
  acts_as_tenant(:organization)


	serialize :params


end
