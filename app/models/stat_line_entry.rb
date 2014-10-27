class StatLineEntry < ActiveRecord::Base
	belongs_to :stat_line
	has_many :stat_line_items, :through => :stat_line
	has_many :stat_line_item_entries

	belongs_to :competition
	has_many :stat_line_entry_units, :foreign_key => :stat_line_entry_id
	has_many :stat_units, :through => :stat_line_entry_units
	# accepts_nested_attributes_for :stat_line_item_entries, :allow_destroy => true
	accepts_nested_attributes_for :stat_line_entry_units, :allow_destroy => true
end
