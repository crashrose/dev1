class Formation < ActiveRecord::Base
	belongs_to :team_role, inverse_of: :formations
	has_many :lineup_formations, inverse_of: :formation
	has_many :formation_positions, inverse_of: :formation
end
