class StatLineItem < ActiveRecord::Base
	belongs_to :stat_line
	has_many :stat_line_item_entries
	has_many :stat_line_entries, :through => :stat_line_item_entries

	# delegate :order_pos, to: :stat_line_item_entries
end
