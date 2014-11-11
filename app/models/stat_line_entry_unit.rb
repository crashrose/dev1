class StatLineEntryUnit < ActiveRecord::Base
	belongs_to :stat_line_entry, :inverse_of => :stat_line_entry_units
	has_one :stat_line, :through => :stat_line_entry
	has_many :stat_line_items, :through => :stat_line
	# belongs_to :stat_line_entry
	has_many :stat_line_item_entries
	# has_many :stat_line_items, :through => :stat_line_item_entries#, :order => :order_pos
	has_one :competition, :through => :stat_line_entry
	belongs_to :stat_line_unit
	belongs_to :unit, class_name: "Person", :inverse_of => :stat_line_entry_units
	# belongs_to :user, :foreign_key => :unit_id#, :primary_key => :user_id
	# delegate :person, to: :stat_line_unit
	accepts_nested_attributes_for :stat_line_item_entries, :allow_destroy => true, :reject_if => :all_blank




	def load_lines(stat_line)
		# unit = 

		lines = stat_line.stat_line_items.map {|s_l_i| {:stat_line_item_id => s_l_i.stat_line_id}}
		# vvv
		self.stat_line_item_entries.new(lines)
		
		# stat_hash = self.stat_lines
		# self.stat_line_entries.new(:stat_line => self.stat_lines.collect)
		# sss
		self
	end

	def self.build_lines(line_items)
		# @unit = stat_line_entry.stat_line_entry_units.new
		@unit = StatLineEntryUnit.new
		lines = line_items.map {|s_l_i| {:stat_line_item_id => s_l_i.id}}
			@unit.stat_line_item_entries.new(lines)
		@unit
	end


end
