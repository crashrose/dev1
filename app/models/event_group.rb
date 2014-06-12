class EventGroup < ActiveRecord::Base

	belongs_to :group
	belongs_to :event

	# validates :event_id,		:presence =>true
	# validates :group_id,	:presence =>true

end
