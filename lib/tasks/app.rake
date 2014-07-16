
namespace :app do

	desc "Populate the database with development data"

	task :populate => :environment do

		[
			{:first_name => "Darth", :last_name => "Vader"},
			{:first_name => "Commander", :last_name => "Praji"},
			{:first_name => "Biggs", :last_name => "Darklighter"},
			{:first_name   => "Luke", :last_name => "Skywalker"},
			{:first_name => "Han", :last_name => "Solo"}
		].each do |attributes|
			Person.where(first_name: attributes[:first_name], last_name: attributes[:last_name]).first_or_create(attributes)
		end

		[
			{:name => "Rookies", :organization_id => 2},
			{:name => "Vets", :organization_id => 2},
			{:name => "Coaches", :organization_id => 2},
			{:name   => "Administrators", :organization_id => 2}
		].each do |attributes|
			Group.where(name: attributes[:name]).first_or_create(attributes)
		end


		[
			{:user_id => 1, :group_id => 1},
			{:user_id => 2, :group_id => 2},
			{:user_id => 3, :group_id => 3},
			{:user_id => 4, :group_id => 4},
			{:user_id => 5, :group_id => 4}
		].each do |attributes|
			GroupsUser.where(user_id: attributes[:user_id], group_id: attributes[:group_id]).first_or_create(attributes)
		end

		[
			{:name => "playbook"},
			{:name => "multimedia"},
			{:name => "instructional"},
			{:name => "import"},
			{:name => "resource"}
		].each do |attributes|
			FileType.where(name: attributes[:name]).first_or_create(attributes)
		end

		[
			{:title => "global"},
			{:title => "League"},
			{:title => "Team"},
			{:title => "Season"}
		].each do |attributes|
			OrgType.where(title: attributes[:title]).first_or_create(attributes)
		end

[
	{:action => "update", :organization_id => 2, :subject_class => "Event", :action_scope => "all"},
	{:action => "update", :organization_id => 5, :subject_class => "Response", :action_scope => "own"},
	{:action => "create", :organization_id => 5, :subject_class => "Response", :action_scope => "own"},
	{:action => "view", :organization_id => 5, :subject_class => "Event", :action_scope => "all"},
	{:action => "manage", :organization_id => 1, :subject_class => "Location", :action_scope => "all"}
].each do |attributes|
	Permission.where(action: attributes[:action], organization_id: attributes[:organization_id], subject_class: attributes[:subject_class], action_scope: attributes[:action_scope]).first_or_create(attributes)
end
		[
			{:name => "global", :owner_id => 1, :org_type_id => 1, :parent_id => 1},
			{:name => "Sharks", :owner_id => 2, :org_type_id => 3, :parent_id => 3},
			{:name => "IWFL", :owner_id => 3, :org_type_id => 2, :parent_id => 1},
			{:name => "Sharks 2014", :owner_id => 2, :org_type_id => 4, :parent_id => 2},
			{:name => "Divas", :owner_id => 4, :org_type_id => 3, :parent_id => 1}
		].each do |attributes|
			Organization.where(name: attributes[:name], org_type_id: attributes[:org_type_id]).first_or_create(attributes)
		end

		[
			{:action => "update", :organization_id => 2, :subject_class => "Event", :action_scope => "all"},
			{:action => "update", :organization_id => 5, :subject_class => "Response", :action_scope => "own"},
			{:action => "create", :organization_id => 5, :subject_class => "Response", :action_scope => "own"},
			{:action => "view", :organization_id => 5, :subject_class => "Event", :action_scope => "all"},
			{:action => "manage", :organization_id => 1, :subject_class => "Location", :action_scope => "all"}
		].each do |attributes|
			Permission.where(action: attributes[:action], organization_id: attributes[:organization_id], subject_class: attributes[:subject_class], action_scope: attributes[:action_scope]).first_or_create(attributes)
		end
	end
end