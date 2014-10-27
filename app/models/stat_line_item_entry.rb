class StatLineItemEntry < ActiveRecord::Base
	
	belongs_to :stat_line_item
	has_one :stat_line, :through => :stat_line_entry
	has_one :competition, :through => :stat_line_entry
	belongs_to :stat_line_entry_unit
	has_one :stat_line_unit, :through => :stat_line_entry_unit
	has_one :competition, :through => :stat_line_entry_unit
	has_one :stat_line_entry, :through => :stat_line_entry_unit
	has_one :stat_line, :through => :stat_line_entry
	has_one :person, :through => :stat_line_unit

	delegate :order_pos, :to => :stat_line_item

end
