class Group < ActiveRecord::Base

	has_and_belongs_to_many :users
	has_many :event_groups
	has_many :events, :through => :event_groups
end
