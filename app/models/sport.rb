class Sport < ActiveRecord::Base
	has_many :sport_platoons
	has_many :positions, :through => :sport_platoons
	has_many :stat_lines
	
end
