class Group < ActiveRecord::Base

	# has_and_belongs_to_many :users
	has_many :groups_users
	has_many :users, :through => :groups_users, inverse_of: :groups
	has_many :event_groups
	has_many :events, :through => :event_groups
	has_many :upload_groups
	has_many :uploads, :through => :upload_groups
	has_many :groups_payment_requests
	has_many :payment_requests, :through => :groups_payment_requests, class_name: "PaymentRequest", :foreign_key => "payment_request_id"

  belongs_to :organization
  acts_as_tenant(:organization)

	# def ul_groups(upload_id)
	# 	@ul_groups = Groups.upload_groups.where(:upload_id = upload_id)
	# end

	scope :ul_groups,->(org_id)    {where(:upload_groups => {:upload_id => org_id}).joins(:upload_groups)}


	def groups_for_upload(upload_id)
		Group.joins(:upload_groups).where('upload_groups.upload_id' => upload_id).map {|group| group.name}.to_sentence

		# group.users.map {|user| user.name}.join("<BR />")
	end

	def non_users
		User.org_users.where.not(:id => users)
	end

	def org_users
		users.joins(:organization_users).where(:organization_users => {:organization_id => ActsAsTenant.current_tenant.id})
	end

	# def ul_groups

	# end
end