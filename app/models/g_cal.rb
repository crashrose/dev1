class GCal < ActiveRecord::Base
	has_one :organization
	# has_one :tzone


	scope :active_by_org,->(org_id)  {where(organization_id: org_id, active: 1)}
end
