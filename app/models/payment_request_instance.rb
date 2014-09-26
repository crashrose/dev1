class PaymentRequestInstance < ActiveRecord::Base

	has_many :payment_transactions, inverse_of: :payment_request_instance
	# , :foreign_key => :event_user, :primary_key => :event_user, inverse_of: :event_user
	# , :primary_key => "event_user", :foreign_key => "event_user", class_name: "Response"
	# has_one :active_response, -> { where(active: true) },  :primary_key => "event_user", :foreign_key => "event_user", class_name: "Response", inverse_of: :event_user
	# accepts_nested_attributes_for :active_response
	# -> { where active: :true }, class_name: "Response", :primary_key => :event_user
	# has_one :user
	belongs_to :person, class_name: "Person", :foreign_key => "user_id", :primary_key => "user_id"
	# has_many :groups_users
	# has_many :groups, :through => :groups_users
	# has_many :event_groups, :through => :groups
	belongs_to :payment_request


	self.primary_key = :id


end
