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
	{:content_type => "application/pdf", :title => "PDF Document"}, 
	{:content_type => "image/jpeg", :title => "JPG Image"}, 
	{:content_type => "image/gif", :title => "GIF Image"}, 
	{:content_type => "image/png", :title => "PNG Image"}, 
	{:content_type => "audio/mpeg", :title => "MPEG Audio"}, 
	{:content_type => "text/csv", :title => "CSV File"}, 
	{:content_type => "text/plain", :title => "Text File"}, 
	{:content_type => "text/rtf", :title => "RTF File"}, 
	{:content_type => "video/mp4", :title => "MP4 Video"}, 
	{:content_type => "video/ogg", :title => "OGG Video"}, 
	{:content_type => "video/mpeg", :title => "MPEG Video"}, 
	{:content_type => "video/avi", :title => "AVI Video"}, 
	{:content_type => "video/quicktime", :title => "Quicktime Video"}, 
	{:content_type => "video/x-flv", :title => "Flash Video"}, 
	{:content_type => "video/x-ms-wmv", :title => "Windows Media Video"}, 
	{:content_type => "application/msword", :title => "Word Document"}, 
	{:content_type => "application/vnd.openxmlformats-officedocument.wordprocessingml.document", :title => "Word Document"}, 
	{:content_type => "application/vnd.ms-excel", :title => "Spreadsheet"}, 
	{:content_type => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", :title => "Spreadsheet"}, 
	{:content_type => "application/vnd.ms-powerpoint", :title => "Powerpoint"}, 
	{:content_type => "application/vnd.openxmlformats-officedocument.presentationml.presentation", :title => "Powerpoint"}
].each do |attributes|
	MimeType.where(content_type: attributes[:content_type]).first_or_create(attributes)
end

[
	{:id => 1, :title => "Quarterback", :abbreviation => "QB", :role_id => 3, :parent_id => 1, :sport_id => 1, :order_pos => 1},
	{:id => 2, :title => "Running Back", :abbreviation => "RB", :role_id => 3, :parent_id => 2, :sport_id => 1, :order_pos => 2},
	{:id => 3, :title => "Halfback", :abbreviation => "HB", :role_id => 3, :parent_id => 2, :sport_id => 1, :order_pos => 3},
	{:id => 4, :title => "Tailback", :abbreviation => "TB", :role_id => 3, :parent_id => 2, :sport_id => 1, :order_pos => 4},
	{:id => 5, :title => "Fullback", :abbreviation => "FB", :role_id => 3, :parent_id => 2, :sport_id => 1, :order_pos => 5},
	{:id => 6, :title => "Wingback", :abbreviation => "WB", :role_id => 3, :parent_id => 2, :sport_id => 1, :order_pos => 6},
	{:id => 7, :title => "Wide Receiver", :abbreviation => "WR", :role_id => 3, :parent_id => 7, :sport_id => 1, :order_pos => 7},
	{:id => 8, :title => "Tight End", :abbreviation => "TE", :role_id => 3, :parent_id => 8, :sport_id => 1, :order_pos => 8},
	{:id => 9, :title => "Offensive Line", :abbreviation => "OL", :role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 9},
	{:id => 10, :title => "Offensive Tackle", :abbreviation => "OT", :role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 10},
	{:id => 11, :title => "Right Tackle", :abbreviation => "RT", :role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 11},
	{:id => 12, :title => "Left Tackle", :abbreviation => "LT", :role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 12},
	{:id => 13, :title => "Offensive Guard", :abbreviation => "OG", :role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 13},
	{:id => 14, :title => "Left Guard", :abbreviation => "LG", :role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 14},
	{:id => 15, :title => "Right Guard", :abbreviation => "RG", :role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 15},
	{:id => 16, :title => "Center", :abbreviation => "C", :role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 16},
	{:id => 17, :title => "Defensive Line", :abbreviation => "DL", :role_id => 3, :parent_id => 17, :sport_id => 1, :order_pos => 17},
	{:id => 18, :title => "Defensive End", :abbreviation => "DE", :role_id => 3, :parent_id => 17, :sport_id => 1, :order_pos => 18},
	{:id => 19, :title => "Nose Tackle", :abbreviation => "NT", :role_id => 3, :parent_id => 17, :sport_id => 1, :order_pos => 19},
	{:id => 20, :title => "Defensive Tackle", :abbreviation => "DT", :role_id => 3, :parent_id => 17, :sport_id => 1, :order_pos => 20},
	{:id => 21, :title => "Linebacker", :abbreviation => "LB", :role_id => 3, :parent_id => 21, :sport_id => 1, :order_pos => 21},
	{:id => 22, :title => "Inside Linebacker", :abbreviation => "ILB", :role_id => 3, :parent_id => 21, :sport_id => 1, :order_pos => 22},
	{:id => 23, :title => "Outside Linebacker", :abbreviation => "OLB", :role_id => 3, :parent_id => 21, :sport_id => 1, :order_pos => 23},
	{:id => 24, :title => "Middle Linebacker", :abbreviation => "MLB", :role_id => 3, :parent_id => 21, :sport_id => 1, :order_pos => 24},
	{:id => 25, :title => "Weakside Linebacker", :abbreviation => "WLB", :role_id => 3, :parent_id => 21, :sport_id => 1, :order_pos => 25},
	{:id => 26, :title => "Strongside Linebacker", :abbreviation => "SLB", :role_id => 3, :parent_id => 21, :sport_id => 1, :order_pos => 26},
	{:id => 27, :title => "Defensive Back", :abbreviation => "DB", :role_id => 3, :parent_id => 27, :sport_id => 1, :order_pos => 27},
	{:id => 28, :title => "Cornerback", :abbreviation => "CB", :role_id => 3, :parent_id => 27, :sport_id => 1, :order_pos => 28},
	{:id => 29, :title => "Safety", :abbreviation => "S", :role_id => 3, :parent_id => 27, :sport_id => 1, :order_pos => 29},
	{:id => 30, :title => "Strong Safety", :abbreviation => "SS", :role_id => 3, :parent_id => 27, :sport_id => 1, :order_pos => 30},
	{:id => 31, :title => "Free Safety", :abbreviation => "FS", :role_id => 3, :parent_id => 27, :sport_id => 1, :order_pos => 31},
	{:id => 32, :title => "Owner", :abbreviation => "Owner", :role_id => 1, :parent_id => 32, :sport_id => 1, :order_pos => 32},
	{:id => 33, :title => "Chief Executive Officer", :abbreviation => "CEO", :role_id => 1, :parent_id => 33, :sport_id => 1, :order_pos => 33},
	{:id => 34, :title => "Chief Financial Officer", :abbreviation => "CFO", :role_id => 1, :parent_id => 34, :sport_id => 1, :order_pos => 34},
	{:id => 35, :title => "Chief Operating Officer", :abbreviation => "COO", :role_id => 1, :parent_id => 35, :sport_id => 1, :order_pos => 35},
	{:id => 36, :title => "General Manager", :abbreviation => "GM", :role_id => 1, :parent_id => 36, :sport_id => 1, :order_pos => 36},
	{:id => 37, :title => "President", :abbreviation => "Pres", :role_id => 1, :parent_id => 37, :sport_id => 1, :order_pos => 37},
	{:id => 38, :title => "Vice-President", :abbreviation => "VP", :role_id => 1, :parent_id => 38, :sport_id => 1, :order_pos => 38},
	{:id => 39, :title => "Manager", :abbreviation => "Mgr", :role_id => 1, :parent_id => 39, :sport_id => 1, :order_pos => 39},
	{:id => 40, :title => "Scout", :abbreviation => "Scout", :role_id => 1, :parent_id => 40, :sport_id => 1, :order_pos => 40},
	{:id => 41, :title => "Trainer", :abbreviation => "AT", :role_id => 1, :parent_id => 41, :sport_id => 1, :order_pos => 41},
	{:id => 42, :title => "Announcer", :abbreviation => "Anc", :role_id => 1, :parent_id => 42, :sport_id => 1, :order_pos => 42},
	{:id => 43, :title => "Director", :abbreviation => "Dir", :role_id => 1, :parent_id => 43, :sport_id => 1, :order_pos => 43},
	{:id => 44, :title => "League Delegate", :abbreviation => "Del", :role_id => 1, :parent_id => 44, :sport_id => 1, :order_pos => 44},
	{:id => 45, :title => "Head Coach", :abbreviation => "HC", :role_id => 2, :parent_id => 45, :sport_id => 1, :order_pos => 45},
	{:id => 46, :title => "Assistant Head Coach", :abbreviation => "AHC", :role_id => 2, :parent_id => 46, :sport_id => 1, :order_pos => 46},
	{:id => 47, :title => "Assistant Coach", :abbreviation => "AsstC", :role_id => 2, :parent_id => 47, :sport_id => 1, :order_pos => 47},
	{:id => 48, :title => "Offensive Coordinator", :abbreviation => "OC", :role_id => 2, :parent_id => 48, :sport_id => 1, :order_pos => 48},
	{:id => 49, :title => "Defensive Coordinator", :abbreviation => "DC", :role_id => 2, :parent_id => 49, :sport_id => 1, :order_pos => 49},
	{:id => 50, :title => "Quarterbacks Coach", :abbreviation => "QBC", :role_id => 2, :parent_id => 50, :sport_id => 1, :order_pos => 50},
	{:id => 51, :title => "Wide Receivers Coach", :abbreviation => "WRC", :role_id => 2, :parent_id => 51, :sport_id => 1, :order_pos => 51},
	{:id => 52, :title => "Running Backs Coach", :abbreviation => "RBC", :role_id => 2, :parent_id => 52, :sport_id => 1, :order_pos => 52},
	{:id => 53, :title => "Defensive Line Coach", :abbreviation => "DLC", :role_id => 2, :parent_id => 53, :sport_id => 1, :order_pos => 53},
	{:id => 54, :title => "Linebackers Coach", :abbreviation => "LBC", :role_id => 2, :parent_id => 54, :sport_id => 1, :order_pos => 54},
	{:id => 55, :title => "Defensive Backs Coach", :abbreviation => "DBC", :role_id => 2, :parent_id => 55, :sport_id => 1, :order_pos => 55},
	{:id => 56, :title => "Strength/Conditioning Coach", :abbreviation => "SCC", :role_id => 2, :parent_id => 56, :sport_id => 1, :order_pos => 56},
	{:id => 57, :title => "Coach", :abbreviation => "C", :role_id => 2, :parent_id => 57, :sport_id => 1, :order_pos => 57}
].each do |attributes|
	Position.where(title: attributes[:title]).first_or_create(attributes)
end

[
	{:id => 1, :title => "Administrative Staff"},
	{:id => 2, :title => "Coaching Staff"},
	{:id => 3, :title => "Players"},
	{:id => 4, :title => "Other Team Members"}
].each do |attributes|
	TeamRole.where(title: attributes[:title]).first_or_create(attributes)
end


[
	{:id => 1, :title => "Football", :order_pos => 1},
	{:id => 2, :title => "Baseball", :order_pos => 2},
	{:id => 3, :title => "Softball", :order_pos => 3},
	{:id => 4, :title => "Basketball", :order_pos => 4},
	{:id => 5, :title => "Soccer", :order_pos => 5},
	{:id => 6, :title => "Hockey", :order_pos => 6},
	{:id => 7, :title => "Lacrosse", :order_pos => 7},
	{:id => 8, :title => "Field Hockey", :order_pos => 8},
	{:id => 9, :title => "Crew/Rowing", :order_pos => 9},
	{:id => 10, :title => "Track & Field", :order_pos => 10},
	{:id => 11, :title => "Volleyball", :order_pos => 11},
	{:id => 12, :title => "Rugby", :order_pos => 12}
].each do |attributes|
	Sport.where(title: attributes[:title]).first_or_create(attributes)
end