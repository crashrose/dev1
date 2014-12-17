class FormationPosition < ActiveRecord::Base
	belongs_to :formation, inverse_of: :formation_positions
	has_many :lineup_players, inverse_of: :formation_position
	belongs_to :position
end
