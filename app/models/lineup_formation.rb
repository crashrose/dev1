class LineupFormation < ActiveRecord::Base
	belongs_to :formation, inverse_of: :lineup_formations
	belongs_to :lineup_platoon, inverse_of: :lineup_formations
	has_many :lineup_players#, inverse_of: :lineup_formation
	has_one :platoon_area, :through => :lineup_platoon

	scope :by_team_role,->(team_role_id)  {joins(:formation).where(:formations => {:team_role_id => team_role_id})}

	def name
		self.formation.name
	end
end
