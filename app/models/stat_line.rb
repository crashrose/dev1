class StatLine < ActiveRecord::Base
	has_many :stat_line_items
	has_many :stat_line_entries
end
