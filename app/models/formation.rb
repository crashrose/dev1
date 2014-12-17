class Formation < ActiveRecord::Base
	belongs_to :sport_platoon, inverse_of: :formations
	has_one :platoon_area, :through => :sport_platoon
	has_many :lineup_formations, inverse_of: :formation
	has_many :formation_positions, inverse_of: :formation
end
