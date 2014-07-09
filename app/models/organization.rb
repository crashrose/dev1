class Organization < ActiveRecord::Base

scope :current_org,->(org_id)  {where(id: org_id)}

	def self.get_seller_id(org_id)
		return self.current_org(org_id).pluck(:paypal_seller_id)
	end
end
