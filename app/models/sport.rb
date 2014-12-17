class Sport < ActiveRecord::Base

	has_many :team_roles
	has_many :positions, :through => :team_roles
	has_many :stat_lines
end
