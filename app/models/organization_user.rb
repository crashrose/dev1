class OrganizationUser < ActiveRecord::Base

	belongs_to :user
  belongs_to :organization
  has_many :groups_users, :through => :user
  has_many :groups, :through => :groups_users
  has_one :invitation
  acts_as_tenant(:organization)

  def non_groups
  	user.non_groups
  end

end
