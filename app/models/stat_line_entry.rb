class StatLineEntry < ActiveRecord::Base
	belongs_to :stat_line
	has_many :stat_line_items, :through => :stat_line
	

	belongs_to :competition
	belongs_to :person
	# belongs_to :team
	# has_many :stat_line_entry_units, :inverse_of => :stat_line_entry
	has_many :stat_line_item_entries, :inverse_of => :stat_line_entry#, :through => :stat_line_entry_units
	has_many :stat_line_entry_instances
	# has_many :stat_units, :through => :stat_line_entry_units

	accepts_nested_attributes_for :stat_line_item_entries, :allow_destroy => true, reject_if: proc { |attributes| attributes['value'].blank? }
	# accepts_nested_attributes_for :stat_line_entry_units, :allow_destroy => true, reject_if: proc { |attributes| attributes['unit_id'].blank? }

	# belongs_to :person

	# accepts_nested_attributes_for :stat_line_item_entries, :allow_destroy => true, :reject_if => :all_blank
	# has_many :stat_line_item_entries, :foreign_key => :stat_line_entry_unit_id
	# has_many :stat_line_entry_units, :foreign_key => :stat_line_entry_unit_id, :inverse_of => :stat_line_entry
	# scope :current_org,->(org_id)  {where(id: org_id)}
	scope :for_competition,->(competition_id)  {where(:competition_id => competition_id)}
	scope :item_entry_data, includes(stat_line_item_entries: :stat_line_items).order(:order_pos)

	# def build_unit
	# 	unit = self.stat_line_entry_units.new

	# 	lines = unit.stat_line_items.map {|s_l_i| {:stat_line_item_id => s_l_i.stat_line_id}}
	# 	# vvv
	# 	unit.stat_line_item_entries.new(lines)
		
	# 	# stat_hash = self.stat_lines
	# 	# self.stat_line_entries.new(:stat_line => self.stat_lines.collect)
	# 	# sss
	# 	unit
	# end

	def self.build_lines(line_items)
		# @unit = stat_line_entry.stat_line_entry_units.new
		@entry = StatLineEntry.new
		lines = line_items.map {|s_l_i| {:stat_line_item_id => s_l_i.id, :order_pos => s_l_i.order_pos}}
			@entry.stat_line_item_entries.new(lines)
		@entry
	end

	# def initialize
	# end
end
