class Competition < ActiveRecord::Base
	# has_one :event, :foreign_key => :id, :primary_key => :event_id
	# has_many :event_groups, :through => :event
	# has_many :groups, :through => :event_groups
	belongs_to :campaign
	acts_as :event#, :as => :eventable

	has_many :stat_line_entries
	has_many :stat_line_item_entries, :through => :stat_line_entries
	accepts_nested_attributes_for :stat_line_entries, :allow_destroy => true
	# accepts_nested_attributes_for :stat_line_item_entries, :allow_destroy => true
	belongs_to :event_type#, -> {where('event_types.event_class = events.as_event_type')}
	belongs_to :location
	belongs_to :owner, class_name: "Person", primary_key: "user_id"

	# belongs_to :event, :as => :eventable#, :foreign_key => :id, :primary_key => :event_id
end
