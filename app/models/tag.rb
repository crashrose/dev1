class Tag < ActiveRecord::Base

  belongs_to :organization
  acts_as_tenant(:organization)

end
