class LineupFormation < ActiveRecord::Base
	belongs_to :formation, inverse_of: :lineup_formations
	belongs_to :platoon, inverse_of: :lineup_formations
	has_many :lineup_players, inverse_of: :lineup_formation

	scope :by_team_role,->(team_role_id)  {joins(:formation).where(:formations => {:team_role_id => team_role_id})}

	def name
		self.formation.name
	end
end
