class LineupPlatoon < ActiveRecord::Base
	belongs_to :sport_platoon, inverse_of: :lineup_platoons
	belongs_to :competition, inverse_of: :lineup_platoons
	has_many :lineup_formations, inverse_of: :lineup_platoon
	has_many :formations, :through => :lineup_formations
	has_one :platoon_area, :through => :sport_platoon


	belongs_to :starting_lineup_formation, :foreign_key => :starting_lineup_formation_id, :primary_key => :id, class_name: "LineupFormation"
	has_many :starting_lineup_players, :through => :starting_lineup_formation, :source => :lineup_players
	has_many :non_starting_formations, ->(lineup_platoon) { where.not(id: lineup_platoon.starting_lineup_formation_id) }, :primary_key => :id, class_name: "LineupFormation"


	def non_used_formations
		sport_platoon.formations.where.not(:id => formations.collect(&:id))
	end

end