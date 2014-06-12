class Event < ActiveRecord::Base

	belongs_to :event_type
	belongs_to :location
	belongs_to :owner, class_name: "Person", primary_key: "user_id"

	has_many :event_groups, autosave: :true, :dependent => :destroy
	# accepts_nested_attributes_for :event_groups
	has_many :groups, :through => :event_groups
	has_many :event_users, foreign_key: "event_id"
	has_many :attendees, class_name: "Person", :through => :event_users, :source => :attendee, :foreign_key => "user_id", :primary_key => "user_id"
	# , foreign_key: "user_id"
	has_many :users, :through => :event_users
	has_many :responses, :dependent => :destroy

	# validates :name,			:presence =>true
 #    validates :event_dt,		:presence =>true
 #    validates :event_type_id,	:presence =>true
 #    validates :location_id,		:presence =>true

  # scope :all_event_users,  { where("created_at < ?") }
  # Client.joins('LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')


def self.awaiting_response
	# event_users = self.all
	@event_users = self.includes(:users)
	return @event_users

end


end
