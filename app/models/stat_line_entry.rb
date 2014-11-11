class StatLineEntry < ActiveRecord::Base
	belongs_to :stat_line
	has_many :stat_line_items, :through => :stat_line
	

	belongs_to :competition
	has_many :stat_line_entry_units, :inverse_of => :stat_line_entry
	has_many :stat_line_item_entries, :through => :stat_line_entry_units
	has_many :stat_line_entry_instances
	# has_many :stat_units, :through => :stat_line_entry_units

	accepts_nested_attributes_for :stat_line_item_entries, :allow_destroy => true, reject_if: proc { |attributes| attributes['value'].blank? }
	accepts_nested_attributes_for :stat_line_entry_units, :allow_destroy => true, reject_if: proc { |attributes| attributes['unit_id'].blank? }

	# belongs_to :person

	# accepts_nested_attributes_for :stat_line_item_entries, :allow_destroy => true, :reject_if => :all_blank
	# has_many :stat_line_item_entries, :foreign_key => :stat_line_entry_unit_id
	# has_many :stat_line_entry_units, :foreign_key => :stat_line_entry_unit_id, :inverse_of => :stat_line_entry
	# scope :current_org,->(org_id)  {where(id: org_id)}

	def build_unit
		unit = self.stat_line_entry_units.new

		lines = unit.stat_line_items.map {|s_l_i| {:stat_line_item_id => s_l_i.stat_line_id}}
		# vvv
		unit.stat_line_item_entries.new(lines)
		
		# stat_hash = self.stat_lines
		# self.stat_line_entries.new(:stat_line => self.stat_lines.collect)
		# sss
		unit
	end

	# def initialize
	# end
end
