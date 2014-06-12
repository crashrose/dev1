class GroupsUser < ActiveRecord::Base

	belongs_to :group
	belongs_to :user
	belongs_to :person, class_name: 'Person', foreign_key: :user_id

end
