class Competition < ActiveRecord::Base
	# has_one :event, :foreign_key => :id, :primary_key => :event_id
	# has_many :event_groups, :through => :event
	# has_many :groups, :through => :event_groups

	acts_as :event#, :as => :eventable

	# belongs_to :event, :as => :eventable#, :foreign_key => :id, :primary_key => :event_id
end
