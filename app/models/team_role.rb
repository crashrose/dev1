class TeamRole < ActiveRecord::Base
	has_many :sport_platoons, inverse_of: :team_role
	has_many :positions, :through => :sport_platoons
	# belongs_to :sport
	belongs_to :team_role_type
	# has_many :formations, inverse_of: :team_role


end
