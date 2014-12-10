class TeamRoleType < ActiveRecord::Base
	has_many :team_roles
	has_many :positions, :through => :team_roles
end
