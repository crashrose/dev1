class EventUser < ActiveRecord::Base

	has_many :responses, inverse_of: :event_user
	# , :foreign_key => :event_user, :primary_key => :event_user, inverse_of: :event_user
	# , :primary_key => "event_user", :foreign_key => "event_user", class_name: "Response"
	# has_one :active_response, -> { where(active: true) },  :primary_key => "event_user", :foreign_key => "event_user", class_name: "Response", inverse_of: :event_user
	# accepts_nested_attributes_for :active_response
	# -> { where active: :true }, class_name: "Response", :primary_key => :event_user
	# has_one :user
	belongs_to :attendee, class_name: "Person", :foreign_key => "user_id", :primary_key => "user_id"
	# has_many :groups_users
	# has_many :groups, :through => :groups_users
	# has_many :event_groups, :through => :groups
	belongs_to :event

	scope :all_events,		-> 		{EventUser.includes(:responses, event: [:location, :event_type])}
	# scope :all_awaiting,		-> 		{ (include: :response).where("responses.id is null or response.")}
	# scope :all_responded,		-> 		{ (include: :response)}
	# scope :all_unsure,		-> 		{ (include: :response)}
	# scope :all_yes,		-> 		{ (include: :response)}
	# scope :all_no,		-> 		{ (include: :response)}


self.primary_key = :id


def name
"#{self.event_id}_#{self.user_id}"
end


def event_date
	self.event.starts_at
end

def event_type
	self.event.event_type.title
end

def event_location
	self.event.location.name
end



end