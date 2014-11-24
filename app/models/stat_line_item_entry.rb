class StatLineItemEntry < ActiveRecord::Base
	
	belongs_to :stat_line_item
	belongs_to :stat_line_entry#_unit
	
	
	# has_one :stat_line_entry, :through => :stat_line_entry_unit
	has_one :competition, :through => :stat_line_entry
	has_one :stat_line, :through => :stat_line_entry
	has_one :person, :through => :stat_line_entry


	# has_one :unit, :through => :stat_line_entry_unit
	
	# has_one :stat_line_unit, :through => :stat_line_entry_unit
	# has_one :competition, :through => :stat_line_entry_unit

	# has_one :stat_line_entry, :through => :stat_line_entry_unit
	# has_one :stat_line, :through => :stat_line_entry
	# has_one :unit, :through => :stat_line_unit

	# belongs_to :stat_line_entry#, :foreign_key => :stat_line_entry_unit_id
	# has_one :person, :through => :stat_line_entry
	# has_one :competition, :through => :stat_line_entry


# default_scope :include => :stat_line_item, :order => ["order_pos ASC"]
	# delegate :order_pos, :to => :stat_line_item


def order_pos
	@order_pos
end

def order_pos=(order=nil)
	@order_pos = order
end


end
