class Sport < ActiveRecord::Base

	has_many :positions
	has_many :stat_lines
end
