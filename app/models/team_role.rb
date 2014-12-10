class TeamRole < ActiveRecord::Base

	has_many :positions
	belongs_to :sport
	belongs_to :team_role_type
	has_many :formations, inverse_of: :team_role
	has_many :platoons, inverse_of: :team_role

end
