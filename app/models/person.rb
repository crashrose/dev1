class Person < ActiveRecord::Base

	has_one :user
	has_many :owned_events, class_name: "Event", foreign_key: "owner_id", :source => :owner
	has_and_belongs_to_many :groups	
	has_many :event_users, :source => :attendee
	has_many :events, :through => :event_users

	validates :first_name,	:presence =>true
	validates :last_name,	:presence =>true

	def name
			"#{first_name} #{last_name}"
	end


end
