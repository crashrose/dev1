class StatLineEntryUnit < ActiveRecord::Base
	belongs_to :stat_line_entry
	has_one :stat_line, :through => :stat_line_entry
	# belongs_to :stat_line_entry
	has_many :stat_line_item_entries
	# has_many :stat_line_items, :through => :stat_line_item_entries#, :order => :order_pos
	has_one :competition, :through => :stat_line_entry
	belongs_to :stat_line_unit
	belongs_to :unit, class_name: "Person", :inverse_of => :stat_line_entry_units
	# belongs_to :user, :foreign_key => :unit_id#, :primary_key => :user_id
	# delegate :person, to: :stat_line_unit
	accepts_nested_attributes_for :stat_line_item_entries, :allow_destroy => true
end
