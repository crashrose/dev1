class Platoon < ActiveRecord::Base
	belongs_to :team_role, inverse_of: :platoons
	belongs_to :competition, inverse_of: :platoons
	has_many :lineup_formations, inverse_of: :platoon

	belongs_to :starting_lineup_formation, :foreign_key => :starting_lineup_formation_id, :primary_key => :id, class_name: "LineupFormation"
end
 