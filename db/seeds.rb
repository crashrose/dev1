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


[
	{:content_type => "application/pdf", :file_type => "PDF Document"}, 
	{:content_type => "image/jpeg", :file_type => "JPG Image"}, 
	{:content_type => "image/gif", :file_type => "GIF Image"}, 
	{:content_type => "image/png", :file_type => "PNG Image"}, 
	{:content_type => "audio/mpeg", :file_type => "MPEG Audio"}, 
	{:content_type => "text/csv", :file_type => "CSV File"}, 
	{:content_type => "text/plain", :file_type => "Text File"}, 
	{:content_type => "text/rtf", :file_type => "RTF File"}, 
	{:content_type => "video/mp4", :file_type => "MP4 Video"}, 
	{:content_type => "video/ogg", :file_type => "OGG Video"}, 
	{:content_type => "video/mpeg", :file_type => "MPEG Video"}, 
	{:content_type => "video/avi", :file_type => "AVI Video"}, 
	{:content_type => "video/quicktime", :file_type => "Quicktime Video"}, 
	{:content_type => "video/x-flv", :file_type => "Flash Video"}, 
	{:content_type => "video/x-ms-wmv", :file_type => "Windows Media Video"}, 
	{:content_type => "application/msword", :file_type => "Word Document"}, 
	{:content_type => "application/vnd.openxmlformats-officedocument.wordprocessingml.document", :file_type => "Word Document"}, 
	{:content_type => "application/vnd.ms-excel", :file_type => "Spreadsheet"}, 
	{:content_type => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", :file_type => "Spreadsheet"}, 
	{:content_type => "application/vnd.ms-powerpoint", :file_type => "Powerpoint"}, 
	{:content_type => "application/vnd.openxmlformats-officedocument.presentationml.presentation", :file_type => "Powerpoint"}
].each do |attributes|
	MimeType.where(content_type: attributes[:content_type]).first_or_create(attributes)
end