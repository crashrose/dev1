
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
	User.where(first_name: attributes[:first_name], last_name: attributes[:last_name]).first_or_create(attributes)
end

[
	{:name => "Rookies"},
	{:name => "Vets"},
	{:name => "Coaches"},
	{:name   => "Administrators"}
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
	GroupMember.where(user_id: attributes[:user_id], group_id: attributes[:group_id]).first_or_create(attributes)
end

end
end