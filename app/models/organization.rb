class Organization < ActiveRecord::Base

	has_many :organization_users
	has_many :users, :through => :organization_users
	has_many :invitations
	belongs_to :sport

scope :current_org,->(org_id)  {where(id: org_id)}

	def self.get_seller_id(org_id)
		return self.current_org(org_id).pluck(:paypal_seller_id)
	end
end
