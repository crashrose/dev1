class LineupPlayer < ActiveRecord::Base
	belongs_to :lineup_formation, inverse_of: :lineup_players
	belongs_to :formation_position, inverse_of: :lineup_players
	belongs_to :person, inverse_of: :lineup_players
end
