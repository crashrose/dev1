class GCal < ActiveRecord::Base
	has_one :organization
	# has_one :tzone
  belongs_to :organization
  acts_as_tenant(:organization)


	scope :active_by_org,->(org_id)  {where(organization_id: org_id, active: true)}
end
