class StatLine < ActiveRecord::Base
	has_many :stat_line_items
	has_many :stat_line_entries
	belongs_to :stat_category

	scope :non_calc, -> { where(is_calc_only: false)}
end
