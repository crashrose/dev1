class SportPlatoon < ActiveRecord::Base
	has_many :lineup_platoons#, inverse_of: :sport_platoon
	has_many :starting_lineup_formations, :through => :lineup_platoons
	has_many :starting_lineup_players, :through => :starting_lineup_formations

	

	has_many :formations, inverse_of: :sport_platoon
	belongs_to :sport, inverse_of: :sport_platoons
	# belongs_to :team_role, inverse_of: :sport_platoons
	belongs_to :platoon_area, class_name: "SportPlatoon", primary_key: "id", foreign_key: "parent_id"
	has_many :children, -> {where(:requires_lineup => true)}, class_name: "SportPlatoon", foreign_key: "parent_id", primary_key: "id"
	has_many :child_lineup_platoons, :through => :children, :source => :lineup_platoons
	has_many :child_starting_players, :through => :child_lineup_platoons, :source => :starting_lineup_players 

	scope :required,-> {where(:requires_lineup => true)}
end
