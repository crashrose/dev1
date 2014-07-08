# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
	{:title => "Awaiting Approval",	:position => 1},
	{:title => "Approved",	:text => "Approve", :position => 2},
	{:title => "Rejected",	:text => "Reject",	:position => 3}
].each do |attributes|
	ReviewStatus.where(title: attributes[:title]).first_or_create(attributes)
end

[
	{:title => "Work",	:position => 1, :organization_id => 2},
	{:title => "Family Event",	:position => 2, :organization_id => 2},
	{:title => "Doctor Appointment",	:position => 3, :organization_id => 2},
	{:title => "School",	:position => 4, :organization_id => 2},
	{:title => "Other Sport",	:position => 5, :organization_id => 2},
	{:title => "Not Listed",	:position => 6, :organization_id => 2}
].each do |attributes|
	ResponseReason.where(title: attributes[:title]).first_or_create(attributes)
end

[
	{:title => "No Response",	:position => 1},
	{:title => "Unsure",	:text => "Unsure", :position => 2},
	{:title => "Yes",	:text => "Attending", :position => 3},
	{:title => "No",	:text => "Not Attending",	:position => 4}
].each do |attributes|
	ResponseStatus.where(title: attributes[:title]).first_or_create(attributes)
end

[
	{:title => "Practice",	:position => 1},
	{:title => "Game",	:position => 2},
	{:title => "Film Session",	:position => 3},
	{:title => "Meeting",	:position => 4},
	{:title => "Classroom Session",	:position => 5},
	{:title => "Mini-Camp",	:position => 6},
	{:title => "Scrimmage",	:position => 7},
	{:title => "Meal",	:position => 8},
	{:title => "Unknown",	:position => 9}
].each do |attributes|
	EventType.where(title: attributes[:title]).first_or_create(attributes)
end