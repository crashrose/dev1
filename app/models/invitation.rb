class Invitation < ActiveRecord::Base

	belongs_to :organization_user
	acts_as_tenant(:organization)
end
