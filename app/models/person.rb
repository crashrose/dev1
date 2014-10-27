class Person < ActiveRecord::Base

	has_one :user
	has_many :owned_events, class_name: "Event", foreign_key: "owner_id", :source => :owner
	has_and_belongs_to_many :groups	
	has_many :event_users, :source => :attendee
	has_many :events, :through => :event_users
  has_many :campaign_users, foreign_key: "user_id", primary_key: "user_id", inverse_of: :person
  has_many :campaigns, :through => :campaign_users
  # has_many :campaign_user_positions, :through => :campaign_users#, inverse_of: :user
  has_many :positions, :through => :campaign_users, inverse_of: :people
  has_many :stat_line_entry_units, foreign_key: "unit_id", primary_key: "user_id", :inverse_of => :unit
  accepts_nested_attributes_for :stat_line_entry_units, :allow_destroy => true
  # has_many :stat_line_entry_units, 

	validates :first_name,	:presence =>true
	validates :last_name,	:presence =>true

	def name
			"#{first_name} #{last_name}"
	end


end
