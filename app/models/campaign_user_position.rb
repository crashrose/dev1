class CampaignUserPosition < ActiveRecord::Base

	belongs_to :campaign_user
	has_one :user, :through => :campaign_user
	belongs_to :position
	belongs_to :organization

	acts_as_tenant(:organization)

end
