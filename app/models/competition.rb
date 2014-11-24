class Competition < ActiveRecord::Base
	# has_one :event, :foreign_key => :id, :primary_key => :event_id
	# has_many :event_groups, :through => :event
	# has_many :groups, :through => :event_groups
	belongs_to :campaign
	has_one :organization, :through => :event
	has_one :sport, :through => :organization
	has_many :stat_lines, :through => :sport
	acts_as :event#, :as => :eventable

	has_many :stat_line_entries
	# has_many :manual_stat_line_entries, class_name: "StatLineEntry", :conditions => { :stat_line => {:is_calc_only => false}}
	has_many :stat_line_item_entries, :through => :stat_line_entries
	accepts_nested_attributes_for :stat_line_entries, :allow_destroy => true, reject_if: proc { |attributes| attributes['person_id'].blank? }
	# accepts_nested_attributes_for :stat_line_item_entries, :allow_destroy => true
	belongs_to :event_type#, -> {where('event_types.event_class = events.as_event_type')}
	belongs_to :location
	belongs_to :owner, class_name: "Person", primary_key: "user_id"

	# belongs_to :event, :as => :eventable#, :foreign_key => :id, :primary_key => :event_id

	def load_statistics
		new_stats = self.stat_lines.map {|s_l| {:stat_line_id => s_l.id}} - self.stat_line_entries.map {|s_l_e| {:stat_line_id => s_l_e.stat_line_id}}
		# vvv
		new_entries = self.stat_line_entries.new(new_stats)
		# new_entries.stat_line_units.new
		new_entries.each do |entry|

			
			new_unit = entry.stat_line_entry_units.new
			entry.stat_line_items.each do |item|
				new_unit.stat_line_item_entries.new(:stat_line_item_id => item.id)
			end
			# StatLineEntryInstance.build_instance(entry)
			# entry.stat_line_entry_instances.new
		end
		# zzz
		# stat_hash = self.stat_lines
		# self.stat_line_entries.new(:stat_line => self.stat_lines.collect)
		# sss
		self
	end
end
