class Group < ActiveRecord::Base

	has_and_belongs_to_many :users
	has_many :event_groups
	has_many :events, :through => :event_groups
	has_many :upload_groups
	has_many :uploads, :through => :upload_groups
	has_and_belongs_to_many :payments
end

public

def userlist_popover(group)
	link_to group.name, '#', {title: group.name,
							 :rel => "popover", 
							 "tabindex" => 0, 
							 "data-toggle" => "popover", 
							 "data-trigger" => "focus", 
							 "data-html" => true, 
							 "data-content" => group.users.map {|user| user.name}.join("<BR />")
							}
end