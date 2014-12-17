# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# [
# 	{:title => "Awaiting Approval",	:position => 1},
# 	{:title => "Approved",	:text => "Approve", :position => 2},
# 	{:title => "Rejected",	:text => "Reject",	:position => 3}
# ].each do |attributes|
# 	ReviewStatus.where(title: attributes[:title]).first_or_create(attributes)
# end

# [
# 	{:title => "Work",	:position => 1, :organization_id => 2},
# 	{:title => "Family Event",	:position => 2, :organization_id => 2},
# 	{:title => "Doctor Appointment",	:position => 3, :organization_id => 2},
# 	{:title => "School",	:position => 4, :organization_id => 2},
# 	{:title => "Other Sport",	:position => 5, :organization_id => 2},
# 	{:title => "Not Listed",	:position => 6, :organization_id => 2}
# ].each do |attributes|
# 	ResponseReason.where(title: attributes[:title]).first_or_create(attributes)
# end

# [
# 	{:title => "No Response",	:position => 1},
# 	{:title => "Unsure",	:text => "Unsure", :position => 2},
# 	{:title => "Yes",	:text => "Attending", :position => 3},
# 	{:title => "No",	:text => "Not Attending",	:position => 4}
# ].each do |attributes|
# 	ResponseStatus.where(title: attributes[:title]).first_or_create(attributes)
# end

# [
# 	{:title => "Practice",	:position => 1},
# 	{:title => "Game",	:position => 2},
# 	{:title => "Film Session",	:position => 3},
# 	{:title => "Meeting",	:position => 4},
# 	{:title => "Classroom Session",	:position => 5},
# 	{:title => "Mini-Camp",	:position => 6},
# 	{:title => "Scrimmage",	:position => 7},
# 	{:title => "Meal",	:position => 8},
# 	{:title => "Unknown",	:position => 9}
# ].each do |attributes|
# 	EventType.where(title: attributes[:title]).first_or_create(attributes)
# end


# [
# 	{:content_type => "application/pdf", :title => "PDF Document"}, 
# 	{:content_type => "image/jpeg", :title => "JPG Image"}, 
# 	{:content_type => "image/gif", :title => "GIF Image"}, 
# 	{:content_type => "image/png", :title => "PNG Image"}, 
# 	{:content_type => "audio/mpeg", :title => "MPEG Audio"}, 
# 	{:content_type => "text/csv", :title => "CSV File"}, 
# 	{:content_type => "text/plain", :title => "Text File"}, 
# 	{:content_type => "text/rtf", :title => "RTF File"}, 
# 	{:content_type => "video/mp4", :title => "MP4 Video"}, 
# 	{:content_type => "video/ogg", :title => "OGG Video"}, 
# 	{:content_type => "video/mpeg", :title => "MPEG Video"}, 
# 	{:content_type => "video/avi", :title => "AVI Video"}, 
# 	{:content_type => "video/quicktime", :title => "Quicktime Video"}, 
# 	{:content_type => "video/x-flv", :title => "Flash Video"}, 
# 	{:content_type => "video/x-ms-wmv", :title => "Windows Media Video"}, 
# 	{:content_type => "application/msword", :title => "Word Document"}, 
# 	{:content_type => "application/vnd.openxmlformats-officedocument.wordprocessingml.document", :title => "Word Document"}, 
# 	{:content_type => "application/vnd.ms-excel", :title => "Spreadsheet"}, 
# 	{:content_type => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", :title => "Spreadsheet"}, 
# 	{:content_type => "application/vnd.ms-powerpoint", :title => "Powerpoint"}, 
# 	{:content_type => "application/vnd.openxmlformats-officedocument.presentationml.presentation", :title => "Powerpoint"}
# ].each do |attributes|
# 	MimeType.where(content_type: attributes[:content_type]).first_or_create(attributes)
# end

# [
# 	{:id => 1, :title => "Quarterback", :abbreviation => "QB", :team_role_id => 3, :parent_id => 1, :sport_id => 1, :order_pos => 1},
# 	{:id => 2, :title => "Running Back", :abbreviation => "RB", :team_role_id => 3, :parent_id => 2, :sport_id => 1, :order_pos => 2},
# 	{:id => 3, :title => "Halfback", :abbreviation => "HB", :team_role_id => 3, :parent_id => 2, :sport_id => 1, :order_pos => 3},
# 	{:id => 4, :title => "Tailback", :abbreviation => "TB", :team_role_id => 3, :parent_id => 2, :sport_id => 1, :order_pos => 4},
# 	{:id => 5, :title => "Fullback", :abbreviation => "FB", :team_role_id => 3, :parent_id => 2, :sport_id => 1, :order_pos => 5},
# 	{:id => 6, :title => "Wingback", :abbreviation => "WB", :team_role_id => 3, :parent_id => 2, :sport_id => 1, :order_pos => 6},
# 	{:id => 7, :title => "Wide Receiver", :abbreviation => "WR", :team_role_id => 3, :parent_id => 7, :sport_id => 1, :order_pos => 7},
# 	{:id => 8, :title => "Tight End", :abbreviation => "TE", :team_role_id => 3, :parent_id => 8, :sport_id => 1, :order_pos => 8},
# 	{:id => 9, :title => "Offensive Line", :abbreviation => "OL", :team_role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 9},
# 	{:id => 10, :title => "Offensive Tackle", :abbreviation => "OT", :team_role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 10},
# 	{:id => 11, :title => "Right Tackle", :abbreviation => "RT", :team_role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 11},
# 	{:id => 12, :title => "Left Tackle", :abbreviation => "LT", :team_role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 12},
# 	{:id => 13, :title => "Offensive Guard", :abbreviation => "OG", :team_role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 13},
# 	{:id => 14, :title => "Left Guard", :abbreviation => "LG", :team_role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 14},
# 	{:id => 15, :title => "Right Guard", :abbreviation => "RG", :team_role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 15},
# 	{:id => 16, :title => "Center", :abbreviation => "C", :team_role_id => 3, :parent_id => 9, :sport_id => 1, :order_pos => 16},
# 	{:id => 17, :title => "Defensive Line", :abbreviation => "DL", :team_role_id => 3, :parent_id => 17, :sport_id => 1, :order_pos => 17},
# 	{:id => 18, :title => "Defensive End", :abbreviation => "DE", :team_role_id => 3, :parent_id => 17, :sport_id => 1, :order_pos => 18},
# 	{:id => 19, :title => "Nose Tackle", :abbreviation => "NT", :team_role_id => 3, :parent_id => 17, :sport_id => 1, :order_pos => 19},
# 	{:id => 20, :title => "Defensive Tackle", :abbreviation => "DT", :team_role_id => 3, :parent_id => 17, :sport_id => 1, :order_pos => 20},
# 	{:id => 21, :title => "Linebacker", :abbreviation => "LB", :team_role_id => 3, :parent_id => 21, :sport_id => 1, :order_pos => 21},
# 	{:id => 22, :title => "Inside Linebacker", :abbreviation => "ILB", :team_role_id => 3, :parent_id => 21, :sport_id => 1, :order_pos => 22},
# 	{:id => 23, :title => "Outside Linebacker", :abbreviation => "OLB", :team_role_id => 3, :parent_id => 21, :sport_id => 1, :order_pos => 23},
# 	{:id => 24, :title => "Middle Linebacker", :abbreviation => "MLB", :team_role_id => 3, :parent_id => 21, :sport_id => 1, :order_pos => 24},
# 	{:id => 25, :title => "Weakside Linebacker", :abbreviation => "WLB", :team_role_id => 3, :parent_id => 21, :sport_id => 1, :order_pos => 25},
# 	{:id => 26, :title => "Strongside Linebacker", :abbreviation => "SLB", :team_role_id => 3, :parent_id => 21, :sport_id => 1, :order_pos => 26},
# 	{:id => 27, :title => "Defensive Back", :abbreviation => "DB", :team_role_id => 3, :parent_id => 27, :sport_id => 1, :order_pos => 27},
# 	{:id => 28, :title => "Cornerback", :abbreviation => "CB", :team_role_id => 3, :parent_id => 27, :sport_id => 1, :order_pos => 28},
# 	{:id => 29, :title => "Safety", :abbreviation => "S", :team_role_id => 3, :parent_id => 27, :sport_id => 1, :order_pos => 29},
# 	{:id => 30, :title => "Strong Safety", :abbreviation => "SS", :team_role_id => 3, :parent_id => 27, :sport_id => 1, :order_pos => 30},
# 	{:id => 31, :title => "Free Safety", :abbreviation => "FS", :team_role_id => 3, :parent_id => 27, :sport_id => 1, :order_pos => 31},
# 	{:id => 32, :title => "Owner", :abbreviation => "Owner", :team_role_id => 1, :parent_id => 32, :sport_id => 1, :order_pos => 32},
# 	{:id => 33, :title => "Chief Executive Officer", :abbreviation => "CEO", :team_role_id => 1, :parent_id => 33, :sport_id => 1, :order_pos => 33},
# 	{:id => 34, :title => "Chief Financial Officer", :abbreviation => "CFO", :team_role_id => 1, :parent_id => 34, :sport_id => 1, :order_pos => 34},
# 	{:id => 35, :title => "Chief Operating Officer", :abbreviation => "COO", :team_role_id => 1, :parent_id => 35, :sport_id => 1, :order_pos => 35},
# 	{:id => 36, :title => "General Manager", :abbreviation => "GM", :team_role_id => 1, :parent_id => 36, :sport_id => 1, :order_pos => 36},
# 	{:id => 37, :title => "President", :abbreviation => "Pres", :team_role_id => 1, :parent_id => 37, :sport_id => 1, :order_pos => 37},
# 	{:id => 38, :title => "Vice-President", :abbreviation => "VP", :team_role_id => 1, :parent_id => 38, :sport_id => 1, :order_pos => 38},
# 	{:id => 39, :title => "Manager", :abbreviation => "Mgr", :team_role_id => 1, :parent_id => 39, :sport_id => 1, :order_pos => 39},
# 	{:id => 40, :title => "Scout", :abbreviation => "Scout", :team_role_id => 1, :parent_id => 40, :sport_id => 1, :order_pos => 40},
# 	{:id => 41, :title => "Trainer", :abbreviation => "AT", :team_role_id => 1, :parent_id => 41, :sport_id => 1, :order_pos => 41},
# 	{:id => 42, :title => "Announcer", :abbreviation => "Anc", :team_role_id => 1, :parent_id => 42, :sport_id => 1, :order_pos => 42},
# 	{:id => 43, :title => "Director", :abbreviation => "Dir", :team_role_id => 1, :parent_id => 43, :sport_id => 1, :order_pos => 43},
# 	{:id => 44, :title => "League Delegate", :abbreviation => "Del", :team_role_id => 1, :parent_id => 44, :sport_id => 1, :order_pos => 44},
# 	{:id => 45, :title => "Head Coach", :abbreviation => "HC", :team_role_id => 2, :parent_id => 45, :sport_id => 1, :order_pos => 45},
# 	{:id => 46, :title => "Assistant Head Coach", :abbreviation => "AHC", :team_role_id => 2, :parent_id => 46, :sport_id => 1, :order_pos => 46},
# 	{:id => 47, :title => "Assistant Coach", :abbreviation => "AsstC", :team_role_id => 2, :parent_id => 47, :sport_id => 1, :order_pos => 47},
# 	{:id => 48, :title => "Offensive Coordinator", :abbreviation => "OC", :team_role_id => 2, :parent_id => 48, :sport_id => 1, :order_pos => 48},
# 	{:id => 49, :title => "Defensive Coordinator", :abbreviation => "DC", :team_role_id => 2, :parent_id => 49, :sport_id => 1, :order_pos => 49},
# 	{:id => 50, :title => "Quarterbacks Coach", :abbreviation => "QBC", :team_role_id => 2, :parent_id => 50, :sport_id => 1, :order_pos => 50},
# 	{:id => 51, :title => "Wide Receivers Coach", :abbreviation => "WRC", :team_role_id => 2, :parent_id => 51, :sport_id => 1, :order_pos => 51},
# 	{:id => 52, :title => "Running Backs Coach", :abbreviation => "RBC", :team_role_id => 2, :parent_id => 52, :sport_id => 1, :order_pos => 52},
# 	{:id => 53, :title => "Defensive Line Coach", :abbreviation => "DLC", :team_role_id => 2, :parent_id => 53, :sport_id => 1, :order_pos => 53},
# 	{:id => 54, :title => "Linebackers Coach", :abbreviation => "LBC", :team_role_id => 2, :parent_id => 54, :sport_id => 1, :order_pos => 54},
# 	{:id => 55, :title => "Defensive Backs Coach", :abbreviation => "DBC", :team_role_id => 2, :parent_id => 55, :sport_id => 1, :order_pos => 55},
# 	{:id => 56, :title => "Strength/Conditioning Coach", :abbreviation => "SCC", :team_role_id => 2, :parent_id => 56, :sport_id => 1, :order_pos => 56},
# 	{:id => 57, :title => "Coach", :abbreviation => "C", :team_role_id => 2, :parent_id => 57, :sport_id => 1, :order_pos => 57}
# ].each do |attributes|
# 	Position.where(id: attributes[:id]).first_or_create(attributes)
# end

# [
# 	{:id => 1, :title => "Administrative Staff"},
# 	{:id => 2, :title => "Coaching Staff"},
# 	{:id => 3, :title => "Players"},
# 	{:id => 4, :title => "Other Team Members"}
# ].each do |attributes|
# 	TeamRole.where(id: attributes[:id]).first_or_create(attributes)
# end


# [
# 	{:id => 1, :title => "Football", :order_pos => 1},
# 	{:id => 2, :title => "Baseball", :order_pos => 2},
# 	{:id => 3, :title => "Softball", :order_pos => 3},
# 	{:id => 4, :title => "Basketball", :order_pos => 4},
# 	{:id => 5, :title => "Soccer", :order_pos => 5},
# 	{:id => 6, :title => "Hockey", :order_pos => 6},
# 	{:id => 7, :title => "Lacrosse", :order_pos => 7},
# 	{:id => 8, :title => "Field Hockey", :order_pos => 8},
# 	{:id => 9, :title => "Crew/Rowing", :order_pos => 9},
# 	{:id => 10, :title => "Track & Field", :order_pos => 10},
# 	{:id => 11, :title => "Volleyball", :order_pos => 11},
# 	{:id => 12, :title => "Rugby", :order_pos => 12}
# ].each do |attributes|
# 	Sport.where(id: attributes[:id]).first_or_create(attributes)
# end


# [
# 	{:id => 1, :title => "Passing", :unit_type => "person"},
# 	{:id => 2, :title => "Rushing", :unit_type => "person"},
# 	{:id => 3, :title => "Receiving", :unit_type => "person"},
# 	{:id => 4, :title => "Tackles", :unit_type => "person"},
# 	{:id => 5, :title => "Tackles for Loss", :unit_type => "person"},
# 	{:id => 6, :title => "Sacks", :unit_type => "person"},
# 	{:id => 7, :title => "Interceptions", :unit_type => "person"},
# 	{:id => 8, :title => "Forced Fumbles", :unit_type => "person"},
# 	{:id => 9, :title => "Recovered Fumbles", :unit_type => "person"},
# 	{:id => 10, :title => "Deflected Passes", :unit_type => "person"},
# 	{:id => 11, :title => "Blocked Kicks", :unit_type => "person"},
# 	{:id => 12, :title => "Blocked Punts", :unit_type => "person"},
# 	{:id => 13, :title => "Kickoff Returns", :unit_type => "person"},
# 	{:id => 14, :title => "Punt Returns", :unit_type => "person"},
# 	{:id => 15, :title => "Punting", :unit_type => "person"},
# 	{:id => 16, :title => "Touchdowns", :unit_type => "person"},
# 	{:id => 17, :title => "Field Goals", :unit_type => "person"},
# 	{:id => 18, :title => "PATs", :unit_type => "person"},
# 	{:id => 19, :title => "PAT 2", :unit_type => "person"},
# 	{:id => 20, :title => "Safeties", :unit_type => "person"},
# 	{:id => 21, :title => "Points Allowed", :unit_type => "team"},
# 	{:id => 22, :title => "Points Scored", :unit_type => "team"},
# 	{:id => 23, :title => "Yards Gained", :unit_type => "team"},
# 	{:id => 24, :title => "Yards Allowed", :unit_type => "team"},
# 	{:id => 25, :title => "Rushing Yards Gained", :unit_type => "team"},
# 	{:id => 26, :title => "Passing Yards Gained", :unit_type => "team"},
# 	{:id => 27, :title => "Rushing Yards Allowed", :unit_type => "team"},
# 	{:id => 28, :title => "Passing Yards Allowed", :unit_type => "team"}
# ].each do |attributes|
# 	StatLine.where(id: attributes[:id]).first_or_create(attributes)
# end


# [
# 	{:id => 1, :title => "Completions", :abbreviation => "Comp", :stat_line_id => 1, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 2, :title => "Attempts", :abbreviation => "Att", :stat_line_id => 1, :order_pos => 2, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 3, :title => "Percent Completed", :abbreviation => "Pct", :stat_line_id => 1, :order_pos => 3, :is_calc => :TRUE, :calculation => "self.stat_line.completions / self.stat_line.attempts", :agg_calculation => ""},
# 	{:id => 4, :title => "Yards", :abbreviation => "Yds", :stat_line_id => 1, :order_pos => 4, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 5, :title => "Longest Gain", :abbreviation => "Long", :stat_line_id => 1, :order_pos => 5, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 6, :title => "Average Yards", :abbreviation => "Avg", :stat_line_id => 1, :order_pos => 6, :is_calc => :TRUE, :calculation => "self.stat_line.yards / self.stat_line.completions", :agg_calculation => ""},
# 	{:id => 7, :title => "Touchdowns", :abbreviation => "TD", :stat_line_id => 1, :order_pos => 7, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 8, :title => "Interceptions", :abbreviation => "Int", :stat_line_id => 1, :order_pos => 8, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 9, :title => "Passer Rating", :abbreviation => "Rating", :stat_line_id => 1, :order_pos => 9, :is_calc => :TRUE, :calculation => "#in process-", :agg_calculation => ""},
# 	{:id => 10, :title => "Carries", :abbreviation => "Car", :stat_line_id => 2, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 11, :title => "Yards", :abbreviation => "Yds", :stat_line_id => 2, :order_pos => 2, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 12, :title => "Longest Gain", :abbreviation => "Long", :stat_line_id => 2, :order_pos => 3, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 13, :title => "Average Yards", :abbreviation => "Avg", :stat_line_id => 2, :order_pos => 4, :is_calc => :TRUE, :calculation => "self.stat_line.yards / self.stat_line.carries", :agg_calculation => ""},
# 	{:id => 14, :title => "Touchdowns", :abbreviation => "TD", :stat_line_id => 2, :order_pos => 5, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 15, :title => "Receptions", :abbreviation => "Rec", :stat_line_id => 3, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 16, :title => "Yards", :abbreviation => "Yds", :stat_line_id => 3, :order_pos => 2, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 17, :title => "Longest Gain", :abbreviation => "Long", :stat_line_id => 3, :order_pos => 3, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 18, :title => "Average Yards", :abbreviation => "Avg", :stat_line_id => 3, :order_pos => 4, :is_calc => :TRUE, :calculation => "self.stat_line.yards / self.stat_line.carries", :agg_calculation => ""},
# 	{:id => 19, :title => "Touchdowns", :abbreviation => "TD", :stat_line_id => 3, :order_pos => 5, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 20, :title => "Tackles", :abbreviation => "Tk", :stat_line_id => 4, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 21, :title => "Tackles for Loss", :abbreviation => "TkL", :stat_line_id => 5, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 22, :title => "Sacks", :abbreviation => "Sck", :stat_line_id => 6, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 23, :title => "Interceptions", :abbreviation => "Int", :stat_line_id => 7, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 24, :title => "Yards", :abbreviation => "Yards", :stat_line_id => 7, :order_pos => 2, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 25, :title => "Longest Return", :abbreviation => "Long", :stat_line_id => 7, :order_pos => 3, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 26, :title => "Touchdowns", :abbreviation => "TD", :stat_line_id => 7, :order_pos => 4, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 27, :title => "Forced Fumbles", :abbreviation => "FFum", :stat_line_id => 8, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 28, :title => "Recovered Fumbles", :abbreviation => "RFum", :stat_line_id => 9, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 29, :title => "Deflected Passes", :abbreviation => "Pdefl", :stat_line_id => 10, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 30, :title => "Blocked Kicks", :abbreviation => "BlkK", :stat_line_id => 11, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 31, :title => "Blocked Punts", :abbreviation => "BlkP", :stat_line_id => 12, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 32, :title => "Returns", :abbreviation => "Ret", :stat_line_id => 13, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 33, :title => "Yards", :abbreviation => "Yds", :stat_line_id => 13, :order_pos => 2, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 34, :title => "Longest Return", :abbreviation => "Long", :stat_line_id => 13, :order_pos => 3, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 35, :title => "Average Yards", :abbreviation => "Avg", :stat_line_id => 13, :order_pos => 4, :is_calc => :TRUE, :calculation => "self.stat_line.yards / self.stat_line.returns", :agg_calculation => ""},
# 	{:id => 36, :title => "Touchdowns", :abbreviation => "TD", :stat_line_id => 13, :order_pos => 5, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 37, :title => "Returns", :abbreviation => "Ret", :stat_line_id => 14, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 38, :title => "Yards", :abbreviation => "Yds", :stat_line_id => 14, :order_pos => 2, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 39, :title => "Longest Return", :abbreviation => "Long", :stat_line_id => 14, :order_pos => 3, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 40, :title => "Average Yards", :abbreviation => "Avg", :stat_line_id => 14, :order_pos => 4, :is_calc => :TRUE, :calculation => "self.stat_line.yards / self.stat_line.returns", :agg_calculation => ""},
# 	{:id => 41, :title => "Touchdowns", :abbreviation => "TD", :stat_line_id => 14, :order_pos => 5, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 42, :title => "Punts", :abbreviation => "P", :stat_line_id => 15, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 43, :title => "Yards", :abbreviation => "Yds", :stat_line_id => 15, :order_pos => 2, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 44, :title => "Touchbacks", :abbreviation => "TchB", :stat_line_id => 15, :order_pos => 3, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 45, :title => "Average Yards", :abbreviation => "Avg", :stat_line_id => 15, :order_pos => 4, :is_calc => :TRUE, :calculation => "self.stat_line.yards / self.stat_line.punts", :agg_calculation => ""},
# 	{:id => 46, :title => "Longest Punt", :abbreviation => "Long", :stat_line_id => 15, :order_pos => 5, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 47, :title => "Touchdowns", :abbreviation => "TD", :stat_line_id => 16, :order_pos => 1, :is_calc => :TRUE, :calculation => "sum all TDs for event (need to work on this)", :agg_calculation => ""},
# 	{:id => 48, :title => "FG Made", :abbreviation => "Made", :stat_line_id => 17, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 49, :title => "FG Attempted", :abbreviation => "Att", :stat_line_id => 17, :order_pos => 2, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 50, :title => "Longest FG", :abbreviation => "Long", :stat_line_id => 17, :order_pos => 3, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 51, :title => "PAT Made", :abbreviation => "Made", :stat_line_id => 18, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 52, :title => "PAT Attempted", :abbreviation => "Att", :stat_line_id => 18, :order_pos => 2, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 53, :title => "2PT Made", :abbreviation => "Made", :stat_line_id => 19, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 54, :title => "2PT Attempted", :abbreviation => "Att", :stat_line_id => 19, :order_pos => 2, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 55, :title => "Safeties", :abbreviation => "Sfty", :stat_line_id => 20, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 56, :title => "Points Allowed", :abbreviation => "Pts", :stat_line_id => 21, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 57, :title => "Points Scored", :abbreviation => "Pts", :stat_line_id => 22, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 58, :title => "Yards Gained", :abbreviation => "Yds", :stat_line_id => 23, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 59, :title => "Yards Allowed", :abbreviation => "Yds", :stat_line_id => 24, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 60, :title => "Rushing Yards Gained", :abbreviation => "Yds", :stat_line_id => 25, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 61, :title => "Passing Yards Gained", :abbreviation => "Yds", :stat_line_id => 26, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 62, :title => "Rushing Yards Gained", :abbreviation => "Yds", :stat_line_id => 27, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""},
# 	{:id => 63, :title => "Passing Yards Gained", :abbreviation => "Yds", :stat_line_id => 28, :order_pos => 1, :is_calc => :FALSE, :calculation => "", :agg_calculation => ""}
# ].each do |attributes|
# 	StatLineItem.where(id: attributes[:id]).first_or_create(attributes)
# end



# [
# 	{:id => 1, :title => "Game", :sport_id => 1},
# 	{:id => 2, :title => "Scrimmage", :sport_id => 1}
# ].each do |attributes|
# 	CompetitionType.where(id: attributes[:id]).first_or_create(attributes)
# end

# [
# 	{:id => 1, :campaign_id => 2, :event_id => 15, :has_stats => :false, :competition_type_id => 1}
# ].each do |attributes|
# 	Competition.where(id: attributes[:id]).first_or_create(attributes)
# end


# [
# 	{:id => 1, :stat_line_id => 4, :competition_id => 1},
# 	{:id => 2, :stat_line_id => 7, :competition_id => 1},
# 	{:id => 3, :stat_line_id => 6, :competition_id => 1},
# 	{:id => 4, :stat_line_id => 17, :competition_id => 1}

# ].each do |attributes|
# 	StatLineEntry.where(id: attributes[:id]).first_or_create(attributes)
# end


# [
# 	{:id => 1, :stat_line_item_id => 22, :stat_line_entry_unit_id => 3, :value => 2},
# 	{:id => 2, :stat_line_item_id => 48, :stat_line_entry_unit_id => 4, :value => 3},
# 	{:id => 3, :stat_line_item_id => 49, :stat_line_entry_unit_id => 4, :value => 4},
# 	{:id => 4, :stat_line_item_id => 50, :stat_line_entry_unit_id => 4, :value => 32},
# 	{:id => 5, :stat_line_item_id => 23, :stat_line_entry_unit_id => 2, :value => 1},
# 	{:id => 6, :stat_line_item_id => 24, :stat_line_entry_unit_id => 2, :value => 22},
# 	{:id => 7, :stat_line_item_id => 25, :stat_line_entry_unit_id => 2, :value => 22},
# 	{:id => 8, :stat_line_item_id => 26, :stat_line_entry_unit_id => 2, :value => 0},
# 	{:id => 9, :stat_line_item_id => 20, :stat_line_entry_unit_id => 1, :value => 8},
# 	{:id => 10, :stat_line_item_id => 22, :stat_line_entry_unit_id => 5, :value => 4},
# 	{:id => 11, :stat_line_item_id => 48, :stat_line_entry_unit_id => 6, :value => 2},
# 	{:id => 12, :stat_line_item_id => 49, :stat_line_entry_unit_id => 6, :value => 2},
# 	{:id => 13, :stat_line_item_id => 50, :stat_line_entry_unit_id => 6, :value => 17}
# ].each do |attributes|
# 	StatLineItemEntry.where(id: attributes[:id]).first_or_create(attributes)
# end


# # [
# # 	{:id => 1, :as_stat_line_unit_id => 1, :as_stat_line_unit_type => "StatUser"},
# # 	{:id => 2, :as_stat_line_unit_id => 2, :as_stat_line_unit_type => "StatUser"},
# # 	{:id => 3, :as_stat_line_unit_id => 1, :as_stat_line_unit_type => "StatTeam"}
# # ].each do |attributes|
# # 	StatLineUnit.where(id: attributes[:id]).first_or_create(attributes)
# # end



# [
# 	{:id => 1, :stat_line_entry_id => 1, :stat_line_unit_id => 1},
# 	{:id => 2, :stat_line_entry_id => 2, :stat_line_unit_id => 1},
# 	{:id => 3, :stat_line_entry_id => 3, :stat_line_unit_id => 1},
# 	{:id => 4, :stat_line_entry_id => 4, :stat_line_unit_id => 1},
# 	{:id => 5, :stat_line_entry_id => 3, :stat_line_unit_id => 2},
# 	{:id => 6, :stat_line_entry_id => 4, :stat_line_unit_id => 2}
# ].each do |attributes|
# 	StatLineEntryUnit.where(id: attributes[:id]).first_or_create(attributes)
# end


# [
# 	{:id => 1, :unit_id => 2}
# ].each do |attributes|
# 	StatTeam.where(id: attributes[:id]).first_or_create(attributes)
# end


# [
# 	{:id => 1, :unit_id => 7},
# 	{:id => 2, :unit_id => 27}
# ].each do |attributes|
# 	StatUser.where(id: attributes[:id]).first_or_create(attributes)
# end


# [
# 	{:title => "Administrative"},
# 	{:title => "Operational"},
# 	{:title => "Coaching Staff"},
# 	{:title => "Player"},
# 	{:title => "Leadership"},
# 	{:title => "Support"}
# ].each do |attributes|
# 	TeamRoleType.where(title: attributes[:title]).first_or_create(attributes)
# end

# [
# 	{:title => "Offense", :team_role_type_id => 4, :sport_id => 1},
# 	{:title => "Defense", :team_role_type_id => 4, :sport_id => 1},
# 	{:title => "Special Teams", :team_role_type_id => 4, :sport_id => 1},
# 	{:title => "Captain", :team_role_type_id => 5, :sport_id => 1},
# 	{:title => "Ownership", :team_role_type_id => 1, :sport_id => 1},
# 	{:title => "Executive", :team_role_type_id => 1, :sport_id => 1},
# 	{:title => "Volunteer", :team_role_type_id => 1, :sport_id => 1},
# 	{:title => "Parent", :team_role_type_id => 6, :sport_id => 1},
# 	{:title => "Fan", :team_role_type_id => 6, :sport_id => 1},
# 	{:title => "Head Coach", :team_role_type_id => 3, :sport_id => 1},
# 	{:title => "Assistant Coach", :team_role_type_id => 3, :sport_id => 1},
# 	{:title => "Coordinator", :team_role_type_id => 3, :sport_id => 1},
# 	{:title => "Position Coach", :team_role_type_id => 3, :sport_id => 1},
# 	{:title => "Training Staff", :team_role_type_id => 2, :sport_id => 1},
# 	{:title => "Coach", :team_role_type_id => 3, :sport_id => 1},
# 	{:title => "Administration", :team_role_type_id => 1, :sport_id => 1},
# ].each do |attributes|
# 	TeamRole.where(title: attributes[:title]).first_or_create(attributes)
# end

# [
# 	{:id => 1, :title => "Quarterback", :abbreviation => "QB", :team_role_id => 5, :parent_id => 1, :order_pos => 1}, 
# 	{:id => 2, :title => "Running Back", :abbreviation => "RB", :team_role_id => 5, :parent_id => 2, :order_pos => 2}, 
# 	{:id => 3, :title => "Halfback", :abbreviation => "HB", :team_role_id => 5, :parent_id => 2, :order_pos => 3}, 
# 	{:id => 4, :title => "Tailback", :abbreviation => "TB", :team_role_id => 5, :parent_id => 2, :order_pos => 4}, 
# 	{:id => 5, :title => "Fullback", :abbreviation => "FB", :team_role_id => 5, :parent_id => 2, :order_pos => 5}, 
# 	{:id => 6, :title => "Wingback", :abbreviation => "WB", :team_role_id => 5, :parent_id => 2, :order_pos => 6}, 
# 	{:id => 7, :title => "Wide Receiver", :abbreviation => "WR", :team_role_id => 5, :parent_id => 7, :order_pos => 7}, 
# 	{:id => 8, :title => "Tight End", :abbreviation => "TE", :team_role_id => 5, :parent_id => 8, :order_pos => 8}, 
# 	{:id => 9, :title => "Offensive Lineman", :abbreviation => "OL", :team_role_id => 5, :parent_id => 9, :order_pos => 9}, 
# 	{:id => 10, :title => "Offensive Tackle", :abbreviation => "OT", :team_role_id => 5, :parent_id => 9, :order_pos => 10}, 
# 	{:id => 11, :title => "Right Tackle", :abbreviation => "RT", :team_role_id => 5, :parent_id => 9, :order_pos => 11}, 
# 	{:id => 12, :title => "Left Tackle", :abbreviation => "LT", :team_role_id => 5, :parent_id => 9, :order_pos => 12}, 
# 	{:id => 13, :title => "Offensive Guard", :abbreviation => "OG", :team_role_id => 5, :parent_id => 9, :order_pos => 13}, 
# 	{:id => 14, :title => "Left Guard", :abbreviation => "LG", :team_role_id => 5, :parent_id => 9, :order_pos => 14}, 
# 	{:id => 15, :title => "Right Guard", :abbreviation => "RG", :team_role_id => 5, :parent_id => 9, :order_pos => 15}, 
# 	{:id => 16, :title => "Center", :abbreviation => "C", :team_role_id => 5, :parent_id => 9, :order_pos => 16}, 
# 	{:id => 17, :title => "Defensive Lineman", :abbreviation => "DL", :team_role_id => 6, :parent_id => 17, :order_pos => 17}, 
# 	{:id => 18, :title => "Defensive End", :abbreviation => "DE", :team_role_id => 6, :parent_id => 17, :order_pos => 18}, 
# 	{:id => 19, :title => "Nose Tackle", :abbreviation => "NT", :team_role_id => 6, :parent_id => 17, :order_pos => 19}, 
# 	{:id => 20, :title => "Defensive Tackle", :abbreviation => "DT", :team_role_id => 6, :parent_id => 17, :order_pos => 20}, 
# 	{:id => 21, :title => "Linebacker", :abbreviation => "LB", :team_role_id => 6, :parent_id => 21, :order_pos => 21}, 
# 	{:id => 22, :title => "Inside Linebacker", :abbreviation => "ILB", :team_role_id => 6, :parent_id => 21, :order_pos => 22}, 
# 	{:id => 23, :title => "Outside Linebacker", :abbreviation => "OLB", :team_role_id => 6, :parent_id => 21, :order_pos => 23}, 
# 	{:id => 24, :title => "Middle Linebacker", :abbreviation => "MLB", :team_role_id => 6, :parent_id => 21, :order_pos => 24}, 
# 	{:id => 25, :title => "Weakside Linebacker", :abbreviation => "WLB", :team_role_id => 6, :parent_id => 21, :order_pos => 25}, 
# 	{:id => 26, :title => "Strongside Linebacker", :abbreviation => "SLB", :team_role_id => 6, :parent_id => 21, :order_pos => 26}, 
# 	{:id => 27, :title => "Defensive Back", :abbreviation => "DB", :team_role_id => 6, :parent_id => 27, :order_pos => 27}, 
# 	{:id => 28, :title => "Cornerback", :abbreviation => "CB", :team_role_id => 6, :parent_id => 27, :order_pos => 28}, 
# 	{:id => 29, :title => "Safety", :abbreviation => "S", :team_role_id => 6, :parent_id => 27, :order_pos => 29}, 
# 	{:id => 30, :title => "Strong Safety", :abbreviation => "SS", :team_role_id => 6, :parent_id => 27, :order_pos => 30}, 
# 	{:id => 31, :title => "Free Safety", :abbreviation => "FS", :team_role_id => 6, :parent_id => 27, :order_pos => 31}, 
# 	{:id => 32, :title => "Owner", :abbreviation => "Owner", :team_role_id => 9, :parent_id => 32, :order_pos => 32}, 
# 	{:id => 33, :title => "Chief Executive Officer", :abbreviation => "CEO", :team_role_id => 10, :parent_id => 33, :order_pos => 33}, 
# 	{:id => 34, :title => "Chief Financial Officer", :abbreviation => "CFO", :team_role_id => 10, :parent_id => 34, :order_pos => 34}, 
# 	{:id => 35, :title => "Chief Operating Officer", :abbreviation => "COO", :team_role_id => 10, :parent_id => 35, :order_pos => 35}, 
# 	{:id => 36, :title => "General Manager", :abbreviation => "GM", :team_role_id => 10, :parent_id => 36, :order_pos => 36}, 
# 	{:id => 37, :title => "President", :abbreviation => "Pres", :team_role_id => 10, :parent_id => 37, :order_pos => 37}, 
# 	{:id => 38, :title => "Vice-President", :abbreviation => "VP", :team_role_id => 10, :parent_id => 38, :order_pos => 38}, 
# 	{:id => 39, :title => "Manager", :abbreviation => "Mgr", :team_role_id => 20, :parent_id => 39, :order_pos => 39}, 
# 	{:id => 40, :title => "Scout", :abbreviation => "Scout", :team_role_id => 20, :parent_id => 40, :order_pos => 40}, 
# 	{:id => 41, :title => "Trainer", :abbreviation => "AT", :team_role_id => 18, :parent_id => 41, :order_pos => 41}, 
# 	{:id => 42, :title => "Announcer", :abbreviation => "Anc", :team_role_id => 21, :parent_id => 42, :order_pos => 42}, 
# 	{:id => 43, :title => "Director", :abbreviation => "Dir", :team_role_id => 20, :parent_id => 43, :order_pos => 43}, 
# 	{:id => 44, :title => "League Delegate", :abbreviation => "Del", :team_role_id => 20, :parent_id => 44, :order_pos => 44}, 
# 	{:id => 45, :title => "Head Coach", :abbreviation => "HC", :team_role_id => 14, :parent_id => 45, :order_pos => 45}, 
# 	{:id => 46, :title => "Assistant Head Coach", :abbreviation => "AHC", :team_role_id => 15, :parent_id => 46, :order_pos => 46}, 
# 	{:id => 47, :title => "Assistant Coach", :abbreviation => "AsstC", :team_role_id => 15, :parent_id => 47, :order_pos => 47}, 
# 	{:id => 48, :title => "Offensive Coordinator", :abbreviation => "OC", :team_role_id => 16, :parent_id => 48, :order_pos => 48}, 
# 	{:id => 49, :title => "Defensive Coordinator", :abbreviation => "DC", :team_role_id => 16, :parent_id => 49, :order_pos => 49}, 
# 	{:id => 50, :title => "Quarterbacks Coach", :abbreviation => "QBC", :team_role_id => 17, :parent_id => 50, :order_pos => 50}, 
# 	{:id => 51, :title => "Wide Receivers Coach", :abbreviation => "WRC", :team_role_id => 17, :parent_id => 51, :order_pos => 51}, 
# 	{:id => 52, :title => "Running Backs Coach", :abbreviation => "RBC", :team_role_id => 17, :parent_id => 52, :order_pos => 52}, 
# 	{:id => 53, :title => "Defensive Line Coach", :abbreviation => "DLC", :team_role_id => 17, :parent_id => 53, :order_pos => 53}, 
# 	{:id => 54, :title => "Linebackers Coach", :abbreviation => "LBC", :team_role_id => 17, :parent_id => 54, :order_pos => 54}, 
# 	{:id => 55, :title => "Defensive Backs Coach", :abbreviation => "DBC", :team_role_id => 17, :parent_id => 55, :order_pos => 55}, 
# 	{:id => 56, :title => "Strength/Conditioning Coach", :abbreviation => "SCC", :team_role_id => 19, :parent_id => 56, :order_pos => 56}, 
# 	{:id => 57, :title => "Coach", :abbreviation => "C", :team_role_id => 19, :parent_id => 57, :order_pos => 57}, 
# 	{:id => 58, :title => "Punter", :abbreviation => "P", :team_role_id => 7, :parent_id => 58, :order_pos => 58}, 
# 	{:id => 59, :title => "Kicker", :abbreviation => "K", :team_role_id => 7, :parent_id => 59, :order_pos => 59}, 
# 	{:id => 60, :title => "Placekicker", :abbreviation => "PK", :team_role_id => 7, :parent_id => 59, :order_pos => 60}, 
# 	{:id => 61, :title => "Personal Protector", :abbreviation => "PP", :team_role_id => 7, :parent_id => 61, :order_pos => 61}, 
# 	{:id => 62, :title => "Kick-off Specialist", :abbreviation => "KOS", :team_role_id => 7, :parent_id => 59, :order_pos => 62}, 
# 	{:id => 63, :title => "Punt Returner", :abbreviation => "PR", :team_role_id => 7, :parent_id => 63, :order_pos => 63}, 
# 	{:id => 64, :title => "Kick Returner", :abbreviation => "KR", :team_role_id => 7, :parent_id => 64, :order_pos => 64}, 
# 	{:id => 65, :title => "Wing", :abbreviation => "W", :team_role_id => 7, :parent_id => 65, :order_pos => 65}, 
# 	{:id => 66, :title => "Gunner", :abbreviation => "GUN", :team_role_id => 7, :parent_id => 66, :order_pos => 66}, 
# 	{:id => 67, :title => "Holder", :abbreviation => "H", :team_role_id => 7, :parent_id => 67, :order_pos => 67}, 
# 	{:id => 68, :title => "Long Snapper", :abbreviation => "LS", :team_role_id => 7, :parent_id => 68, :order_pos => 68}, 
# 	{:id => 69, :title => "Kickoff Cover Left", :abbreviation => "K-L", :team_role_id => 7, :parent_id => 71, :order_pos => 69}, 
# 	{:id => 70, :title => "Kickoff Cover Right", :abbreviation => "K-R", :team_role_id => 7, :parent_id => 71, :order_pos => 70}, 
# 	{:id => 71, :title => "Kickoff Coverage", :abbreviation => "K-C", :team_role_id => 7, :parent_id => 71, :order_pos => 71}, 
# 	{:id => 72, :title => "Kick Return Frontline Blocker", :abbreviation => "KOR-F", :team_role_id => 7, :parent_id => 75, :order_pos => 72}, 
# 	{:id => 73, :title => "Kick Return Midfield Blocker", :abbreviation => "KOR-M", :team_role_id => 7, :parent_id => 75, :order_pos => 73}, 
# 	{:id => 75, :title => "Kick Return Blocker", :abbreviation => "KOR-B", :team_role_id => 7, :parent_id => 75, :order_pos => 75}, 
# ].each do |attributes|
# 	Position.where(id: attributes[:id]).first_or_create(attributes)
# end



# [
# 	{:id => 1, :position_id => 76, :formation_id => 1},
# 	{:id => 2, :position_id => 76, :formation_id => 1},
# 	{:id => 3, :position_id => 76, :formation_id => 1},
# 	{:id => 4, :position_id => 76, :formation_id => 1},
# 	{:id => 5, :position_id => 76, :formation_id => 1},
# 	{:id => 6, :position_id => 76, :formation_id => 1},
# 	{:id => 7, :position_id => 76, :formation_id => 1},
# 	{:id => 8, :position_id => 76, :formation_id => 1},
# 	{:id => 9, :position_id => 76, :formation_id => 1},
# 	{:id => 10, :position_id => 76, :formation_id => 1},
# 	{:id => 11, :position_id => 76, :formation_id => 1},
# 	{:id => 12, :position_id => 77, :formation_id => 2},
# 	{:id => 13, :position_id => 77, :formation_id => 2},
# 	{:id => 14, :position_id => 77, :formation_id => 2},
# 	{:id => 15, :position_id => 77, :formation_id => 2},
# 	{:id => 16, :position_id => 77, :formation_id => 2},
# 	{:id => 17, :position_id => 77, :formation_id => 2},
# 	{:id => 18, :position_id => 77, :formation_id => 2},
# 	{:id => 19, :position_id => 77, :formation_id => 2},
# 	{:id => 20, :position_id => 77, :formation_id => 2},
# 	{:id => 21, :position_id => 77, :formation_id => 2},
# 	{:id => 22, :position_id => 77, :formation_id => 2},
# 	{:id => 23, :position_id => 78, :formation_id => 3},
# 	{:id => 24, :position_id => 78, :formation_id => 3},
# 	{:id => 25, :position_id => 78, :formation_id => 3},
# 	{:id => 26, :position_id => 78, :formation_id => 3},
# 	{:id => 27, :position_id => 78, :formation_id => 3},
# 	{:id => 28, :position_id => 78, :formation_id => 3},
# 	{:id => 29, :position_id => 78, :formation_id => 3},
# 	{:id => 30, :position_id => 78, :formation_id => 3},
# 	{:id => 31, :position_id => 78, :formation_id => 3},
# 	{:id => 32, :position_id => 78, :formation_id => 3},
# 	{:id => 33, :position_id => 78, :formation_id => 3}
#  ].each do |attributes|
# 	FormationPosition.where(id: attributes[:id]).first_or_create(attributes)
# end

# [
# 	{:id => 34, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "adeline590@hotmail.com", :person_id => 13}, 
# 	{:id => 35, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "acasner@gmail.com", :person_id => 14}, 
# 	{:id => 36, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "devilgirl331@aol.com", :person_id => 15}, 
# 	{:id => 37, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "eskanot@yahoo.com", :person_id => 16}, 
# 	{:id => 38, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "a.cantave@aol.com", :person_id => 17}, 
# 	{:id => 39, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "amanda.trontell@gmail.com", :person_id => 18}, 
# 	{:id => 40, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "ambert21@gmail.com", :person_id => 19}, 
# 	{:id => 41, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "asat81@yahoo.com", :person_id => 20}, 
# 	{:id => 42, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "andradouglas@me.com", :person_id => 21}, 
# 	{:id => 43, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "wallsasante@hotmail.com", :person_id => 22}, 
# 	{:id => 44, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "beebz89@yahoo.com", :person_id => 23}, 
# 	{:id => 45, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "Brandyw206@gmail.com", :person_id => 24}, 
# 	{:id => 46, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "coachbbrowne@gmail.com", :person_id => 25}, 
# 	{:id => 47, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "brilynn.fields@gmail.com", :person_id => 26}, 
# 	{:id => 48, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "starborn1220@gmail.com", :person_id => 27}, 
# 	{:id => 49, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "m.i.bernard88@gmail.com", :person_id => 28}, 
# 	{:id => 50, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "charonnsutton@yahoo.com", :person_id => 29}, 
# 	{:id => 51, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "augustecherelle1@gmail.com", :person_id => 30}, 
# 	{:id => 52, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "spinmove32@hotmail.com", :person_id => 31}, 
# 	{:id => 53, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "cocovee1@yahoo.com", :person_id => 32}, 
# 	{:id => 54, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "cam243@aol.com", :person_id => 33}, 
# 	{:id => 55, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "choicelighting@earthlink.net", :person_id => 34}, 
# 	{:id => 56, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "darbykid91@gmail.com", :person_id => 35}, 
# 	{:id => 57, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "blu_pixie@hotmail.com", :person_id => 36}, 
# 	{:id => 58, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "moneta15@gmail.com", :person_id => 37}, 
# 	{:id => 59, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "draytondenisel@aol.com", :person_id => 38}, 
# 	{:id => 60, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "duecebigalo22@yahoo.com", :person_id => 39}, 
# 	{:id => 61, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "Emartinezez1@aol.com", :person_id => 40}, 
# 	{:id => 62, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "erikajay5@gmail.com", :person_id => 41}, 
# 	{:id => 63, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "Lex1castle@yahoo.com", :person_id => 42}, 
# 	{:id => 64, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "fboone11@yahoo.com", :person_id => 43}, 
# 	{:id => 65, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "miraga@mymail.vcu.edu", :person_id => 44}, 
# 	{:id => 66, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "gmpettigano@gmail.com", :person_id => 45}, 
# 	{:id => 67, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "ianaransom@gmail.com", :person_id => 46}, 
# 	{:id => 68, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "janea.wilkerson87@yahoo.com", :person_id => 47}, 
# 	{:id => 69, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "jgoldsac@g.coastal.edu", :person_id => 48}, 
# 	{:id => 70, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "naejmas@aol.com", :person_id => 49}, 
# 	{:id => 71, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "keetzdakingstress@gmail.com", :person_id => 50}, 
# 	{:id => 72, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "gibsoncgjessica29@gmail.com", :person_id => 51}, 
# 	{:id => 73, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "dafixin3lement@gmail.com", :person_id => 52}, 
# 	{:id => 74, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "focxo33@gmail.com", :person_id => 53}, 
# 	{:id => 75, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "josiah@bensingertech.com", :person_id => 54}, 
# 	{:id => 76, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "julia.faith.colangelo@gmail.com", :person_id => 55}, 
# 	{:id => 77, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "nysharks30@yahoo.com", :person_id => 56}, 

# 	{:id => 79, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "kmolina87@gmail.com", :person_id => 58}, 
# 	{:id => 80, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "kymm33@aim.com", :person_id => 59}, 
# 	{:id => 81, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "davis.larissa@gmail.com", :person_id => 60}, 
# 	{:id => 82, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "lgillis17@hotmail.com", :person_id => 61}, 
# 	{:id => 83, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "labaden12@gmail.com", :person_id => 62}, 
# 	{:id => 84, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "leah.maher2@gmail.com", :person_id => 63}, 
# 	{:id => 85, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "Ltankeng@gmail.com", :person_id => 64}, 
# 	{:id => 86, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "layoub758@gmail.com", :person_id => 65}, 
# 	{:id => 87, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "maggienatell@yahoo.com", :person_id => 66}, 
# 	{:id => 88, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "moo-noo30@hotmail.com", :person_id => 67}, 
# 	{:id => 89, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "santiagomarilyn95@gmail.com", :person_id => 68}, 
 
# 	{:id => 91, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "melnkaia34@aol.com", :person_id => 70}, 
# 	{:id => 92, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "splattownusa@yahoo.com", :person_id => 71}, 
# 	{:id => 93, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "monique.salmon1@gmail.com", :person_id => 72}, 
# 	{:id => 94, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "Ndeleon1@me.com", :person_id => 73}, 
# 	{:id => 95, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "nhaslove@gmail.com", :person_id => 74}, 
# 	{:id => 96, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "ndk719@gmail.com", :person_id => 75}, 
# 	{:id => 97, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "tagdnificent@gmail.com", :person_id => 76}, 
# 	{:id => 98, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "pgoldsack61@gmail.com", :person_id => 77}, 
# 	{:id => 99, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "cessjones1982@yahoo.com", :person_id => 78}, 
# 	{:id => 100, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "rachelbaum7@gmail.com", :person_id => 79}, 
# 	{:id => 101, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "reginajaso@yahoo.com", :person_id => 80}, 
# 	{:id => 102, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "srichardharrigan@yahoo.com", :person_id => 81}, 
# 	{:id => 103, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "sabrinaforrester1@gmail.com", :person_id => 82}, 
# 	{:id => 104, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "coach@temp.com", :person_id => 83}, 
# 	{:id => 105, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "schkeeps@gmail.com", :person_id => 84}, 
# 	{:id => 106, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "seletaharrison@gmail.com", :person_id => 85}, 
# 	{:id => 107, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "ibrown@outlook.com", :person_id => 86}, 
# 	{:id => 108, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "tayness15@gmail.com", :person_id => 87}, 
# 	{:id => 109, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "Stefanie.Engels@ifb-group.com", :person_id => 88}, 
# 	{:id => 110, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "stephanielpz2@gmail.com", :person_id => 89}, 
# 	{:id => 111, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "hailransom@gmail.com", :person_id => 90}, 
# 	{:id => 112, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "allwork625@gmail.com", :person_id => 91}, 
# 	{:id => 113, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "rookie@test.com", :person_id => 92}, 
# 	{:id => 114, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "vet@test.com", :person_id => 93}, 
# 	{:id => 115, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "FODT27@gmail.com", :person_id => 94}, 
# 	{:id => 116, :sign_in_count => 0, :failed_attempts => 0, :encrypted_password => "$2a$10$8iuQDCdXNDTBc/9GS/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :email => "yatia.hopkins@gmail.com", :person_id => 95}
#  ].each do |attributes|
#  	# if not User.where(email: attributes[:email])
# 	 	user = User.new
# 	 	user.id = attributes[:id]
# 	 	user.email = attributes[:email]
# 	 	user.person_id = attributes[:person_id]
# 	 	# user.encrypted_password = attributes[:encrypted_password]
# 	 	user.password = "password123"
# 	 	user.password_confirmation = "password123"
# 	 	user.sign_in_count = 0
# 	 	user.failed_attempts = 0
# 	 	user.save!
#  	# end
# 	# User.where(id: attributes[:id]).first_or_create(attributes)
# end

#  [
# 	{:id => 13, :user_id => 34, :first_name => "Adeline", :last_name => "Massicot"}, 
# 	{:id => 14, :user_id => 35, :first_name => "Alana", :last_name => "Casner"}, 
# 	{:id => 15, :user_id => 36, :first_name => "Alexandra", :last_name => "Salfelder"}, 
# 	{:id => 16, :user_id => 37, :first_name => "Alissa", :last_name => "Anderson"}, 
# 	{:id => 17, :user_id => 38, :first_name => "Amanda", :last_name => "Cantave"}, 
# 	{:id => 18, :user_id => 39, :first_name => "Amanda", :last_name => "Trontell"}, 
# 	{:id => 19, :user_id => 40, :first_name => "Amber", :last_name => "Terrell"}, 
# 	{:id => 20, :user_id => 41, :first_name => "Amy", :last_name => "Deal"}, 
# 	{:id => 21, :user_id => 42, :first_name => "Andra", :last_name => "Douglas"}, 
# 	{:id => 22, :user_id => 43, :first_name => "Asante", :last_name => "Walls"}, 
# 	{:id => 23, :user_id => 44, :first_name => "Bianca", :last_name => "Bonet"}, 
# 	{:id => 24, :user_id => 45, :first_name => "Brandy", :last_name => "Williams"}, 
# 	{:id => 25, :user_id => 46, :first_name => "Brian", :last_name => "Browne"}, 
# 	{:id => 26, :user_id => 47, :first_name => "Brilynn", :last_name => "Fields"}, 
# 	{:id => 27, :user_id => 48, :first_name => "Caprece", :last_name => "Gray"}, 
# 	{:id => 28, :user_id => 49, :first_name => "Carmelle", :last_name => "Bernard"}, 
# 	{:id => 29, :user_id => 50, :first_name => "Charonn", :last_name => "Sutton"}, 
# 	{:id => 30, :user_id => 51, :first_name => "Cherelle", :last_name => "Auguste"}, 
# 	{:id => 31, :user_id => 52, :first_name => "Cheri", :last_name => "Eleazer"}, 
# 	{:id => 32, :user_id => 53, :first_name => "Collette", :last_name => "Smith"}, 
# 	{:id => 33, :user_id => 54, :first_name => "Cornelia", :last_name => "Myers"}, 
# 	{:id => 34, :user_id => 55, :first_name => "Dana", :last_name => "Sparling"}, 
# 	{:id => 35, :user_id => 56, :first_name => "Danielle", :last_name => "Darby"}, 
# 	{:id => 36, :user_id => 57, :first_name => "Darleen", :last_name => "Hall"}, 
# 	{:id => 37, :user_id => 58, :first_name => "Dayna", :last_name => "Moneta"}, 
# 	{:id => 38, :user_id => 59, :first_name => "Denise", :last_name => "Drayton"}, 
# 	{:id => 39, :user_id => 60, :first_name => "Duece", :last_name => "Reyes"}, 
# 	{:id => 40, :user_id => 61, :first_name => "Elizabeth", :last_name => "Martinez"}, 
# 	{:id => 41, :user_id => 62, :first_name => "Erika", :last_name => "Cottle"}, 
# 	{:id => 42, :user_id => 63, :first_name => "Faith", :last_name => "Xikis"}, 
# 	{:id => 43, :user_id => 64, :first_name => "Frances", :last_name => "Boone"}, 
# 	{:id => 44, :user_id => 65, :first_name => "Gabriela", :last_name => "Mira"}, 
# 	{:id => 45, :user_id => 66, :first_name => "Gina", :last_name => "Pettigano"}, 
# 	{:id => 46, :user_id => 67, :first_name => "I'ana", :last_name => "Brown-Ranson"}, 
# 	{:id => 47, :user_id => 68, :first_name => "Janea", :last_name => "Wilkerson"}, 
# 	{:id => 48, :user_id => 69, :first_name => "Jenna", :last_name => "Goldsack"}, 
# 	{:id => 49, :user_id => 70, :first_name => "Jennifer", :last_name => "Melendez"}, 
# 	{:id => 50, :user_id => 71, :first_name => "Jerkieda", :last_name => "Grant"}, 
# 	{:id => 51, :user_id => 72, :first_name => "Jessica", :last_name => "Gibson"}, 
# 	{:id => 52, :user_id => 73, :first_name => "Jessica", :last_name => "Olivencia"}, 
# 	{:id => 53, :user_id => 74, :first_name => "Jewelle", :last_name => "Grimsley"}, 
# 	{:id => 54, :user_id => 75, :first_name => "Josiah", :last_name => "Robinson"}, 
# 	{:id => 55, :user_id => 76, :first_name => "Julia", :last_name => "Colangelo"}, 
# 	{:id => 56, :user_id => 77, :first_name => "Karen", :last_name => "Mulligan"}, 
# 	{:id => 57, :user_id => 78, :first_name => "Katie", :last_name => "Rose"}, 
# 	{:id => 58, :user_id => 79, :first_name => "Krystal", :last_name => "Molina"}, 
# 	{:id => 59, :user_id => 80, :first_name => "Kymm", :last_name => "Elliott"}, 
# 	{:id => 60, :user_id => 81, :first_name => "Larissa", :last_name => "Davis"}, 
# 	{:id => 61, :user_id => 82, :first_name => "Laticia", :last_name => "Gillis"}, 
# 	{:id => 62, :user_id => 83, :first_name => "Laura", :last_name => "Baden"}, 
# 	{:id => 63, :user_id => 84, :first_name => "Leah", :last_name => "Maher"}, 
# 	{:id => 64, :user_id => 85, :first_name => "Lenahndem", :last_name => "Tankeng"}, 
# 	{:id => 65, :user_id => 86, :first_name => "Lucy", :last_name => "Ayoub"}, 
# 	{:id => 66, :user_id => 87, :first_name => "Maggie", :last_name => "Natell"}, 
# 	{:id => 67, :user_id => 88, :first_name => "Manouchka", :last_name => "Joseph"}, 
# 	{:id => 68, :user_id => 89, :first_name => "Marilyn", :last_name => "Santiago"}, 
# 	{:id => 69, :user_id => 90, :first_name => "Melissa", :last_name => "Pickett"}, 
# 	{:id => 70, :user_id => 91, :first_name => "Melodie", :last_name => "Abrook"}, 
# 	{:id => 71, :user_id => 92, :first_name => "Michelle", :last_name => "Bresnahan"}, 
# 	{:id => 72, :user_id => 93, :first_name => "Monique", :last_name => "Salmon"}, 
# 	{:id => 73, :user_id => 94, :first_name => "Natasha", :last_name => "DeLeon"}, 
# 	{:id => 74, :user_id => 95, :first_name => "Nhandi", :last_name => "Brown"}, 
# 	{:id => 75, :user_id => 96, :first_name => "Nichole", :last_name => "Kieltyka"}, 
# 	{:id => 76, :user_id => 97, :first_name => "Nicole", :last_name => "Jackson"}, 
# 	{:id => 77, :user_id => 98, :first_name => "Paige", :last_name => "Goldsack"}, 
# 	{:id => 78, :user_id => 99, :first_name => "Princess", :last_name => "Jones"}, 
# 	{:id => 79, :user_id => 100, :first_name => "Rae", :last_name => "Baum"}, 
# 	{:id => 80, :user_id => 101, :first_name => "Regina", :last_name => "Jaso"}, 
# 	{:id => 81, :user_id => 102, :first_name => "Rich", :last_name => "Harrigan"}, 
# 	{:id => 82, :user_id => 103, :first_name => "Sabrina", :last_name => "Forrester"}, 
# 	{:id => 83, :user_id => 104, :first_name => "Sample", :last_name => "Coach"}, 
# 	{:id => 84, :user_id => 105, :first_name => "Sarah", :last_name => "Schkeeper"}, 
# 	{:id => 85, :user_id => 106, :first_name => "Seleta", :last_name => "Harrison"}, 
# 	{:id => 86, :user_id => 107, :first_name => "Shiana", :last_name => "Brown"}, 
# 	{:id => 87, :user_id => 108, :first_name => "Shiante", :last_name => "Wilson"}, 
# 	{:id => 88, :user_id => 109, :first_name => "Stefanie", :last_name => "Engels"}, 
# 	{:id => 89, :user_id => 110, :first_name => "Stephanie", :last_name => "Lopez"}, 
# 	{:id => 90, :user_id => 111, :first_name => "Teia", :last_name => "Ransom"}, 
# 	{:id => 91, :user_id => 112, :first_name => "Telisha", :last_name => "Brown"}, 
# 	{:id => 92, :user_id => 113, :first_name => "Test", :last_name => "Rookie"}, 
# 	{:id => 93, :user_id => 114, :first_name => "Test", :last_name => "Vet"}, 
# 	{:id => 94, :user_id => 115, :first_name => "Vivian", :last_name => "Alberty"}, 
# 	{:id => 95, :user_id => 116, :first_name => "Yatia", :last_name => "Hopkins"}
#  ].each do |attributes|
# 	Person.where(id: attributes[:id]).first_or_create(attributes)
# end


# [
# 	{:id => 4, :name => "Kickoff", :team_role_id => 7}, 
# 	{:id => 5, :name => "Kickoff Return", :team_role_id => 7}, 
# 	{:id => 6, :name => "Field Goal", :team_role_id => 7}, 
# 	{:id => 7, :name => "Field Goal Block", :team_role_id => 7}, 
# 	{:id => 8, :name => "Punt", :team_role_id => 7}, 
# 	{:id => 9, :name => "Punt Return", :team_role_id => 7}
# ].each do |attributes|
# 	Formation.where(id: attributes[:id]).first_or_create(attributes)
# end



# [
# 	{:id => 4, :position_id => 59, :formation_id => 4, :num_required => 1}, 
# 	{:id => 5, :position_id => 69, :formation_id => 4, :num_required => 5}, 
# 	{:id => 6, :position_id => 70, :formation_id => 4, :num_required => 5}, 
# 	{:id => 7, :position_id => 72, :formation_id => 5, :num_required => 6}, 
# 	{:id => 8, :position_id => 73, :formation_id => 5, :num_required => 3}, 
# 	{:id => 9, :position_id => 64, :formation_id => 5, :num_required => 2}, 
# 	{:id => 10, :position_id => 59, :formation_id => 6, :num_required => 1}, 
# 	{:id => 11, :position_id => 67, :formation_id => 6, :num_required => 1}, 
# 	{:id => 12, :position_id => 68, :formation_id => 6, :num_required => 1}, 
# 	{:id => 13, :position_id => 15, :formation_id => 6, :num_required => 1}, 
# 	{:id => 14, :position_id => 14, :formation_id => 6, :num_required => 1}, 
# 	{:id => 15, :position_id => 11, :formation_id => 6, :num_required => 1}, 
# 	{:id => 16, :position_id => 12, :formation_id => 6, :num_required => 1}, 
# 	{:id => 17, :position_id => 8, :formation_id => 6, :num_required => 2}, 
# 	{:id => 18, :position_id => 65, :formation_id => 6, :num_required => 2}, 
# 	{:id => 19, :position_id => 18, :formation_id => 7, :num_required => 2}, 
# 	{:id => 20, :position_id => 20, :formation_id => 7, :num_required => 2}, 
# 	{:id => 21, :position_id => 19, :formation_id => 7, :num_required => 1}, 
# 	{:id => 22, :position_id => 24, :formation_id => 7, :num_required => 1}, 
# 	{:id => 23, :position_id => 23, :formation_id => 7, :num_required => 2}, 
# 	{:id => 24, :position_id => 28, :formation_id => 7, :num_required => 2}, 
# 	{:id => 25, :position_id => 31, :formation_id => 7, :num_required => 1}, 
# 	{:id => 26, :position_id => 58, :formation_id => 8, :num_required => 1}, 
# 	{:id => 27, :position_id => 61, :formation_id => 8, :num_required => 1}, 
# 	{:id => 28, :position_id => 68, :formation_id => 8, :num_required => 1}, 
# 	{:id => 29, :position_id => 15, :formation_id => 8, :num_required => 1}, 
# 	{:id => 30, :position_id => 14, :formation_id => 8, :num_required => 1}, 
# 	{:id => 31, :position_id => 11, :formation_id => 8, :num_required => 1}, 
# 	{:id => 32, :position_id => 12, :formation_id => 8, :num_required => 1}, 
# 	{:id => 33, :position_id => 65, :formation_id => 8, :num_required => 2}, 
# 	{:id => 34, :position_id => 66, :formation_id => 8, :num_required => 2}, 
# 	{:id => 35, :position_id => 18, :formation_id => 9, :num_required => 2}, 
# 	{:id => 36, :position_id => 20, :formation_id => 9, :num_required => 2}, 
# 	{:id => 37, :position_id => 22, :formation_id => 9, :num_required => 2}, 
# 	{:id => 38, :position_id => 23, :formation_id => 9, :num_required => 2}, 
# 	{:id => 39, :position_id => 28, :formation_id => 9, :num_required => 2}, 
# 	{:id => 40, :position_id => 63, :formation_id => 9, :num_required => 1}
# ].each do |attributes|
# 	FormationPosition.where(id: attributes[:id]).first_or_create(attributes)
# end



# [
# 	{:id => 4, :formation_id => 4, :platoon_id => 3}, 
# 	{:id => 5, :formation_id => 5, :platoon_id => 3}, 
# 	{:id => 6, :formation_id => 6, :platoon_id => 3}, 
# 	{:id => 7, :formation_id => 7, :platoon_id => 3}, 
# 	{:id => 8, :formation_id => 8, :platoon_id => 3}, 
# 	{:id => 9, :formation_id => 9, :platoon_id => 3}
# ].each do |attributes|
# 	LineupFormation.where(id: attributes[:id]).first_or_create(attributes)
# end



# [
# 	{:id => 20, :lineup_formation_id => 4, :formation_position_id => 4, :person_id => 13, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 21, :lineup_formation_id => 4, :formation_position_id => 5, :person_id => 14, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 22, :lineup_formation_id => 4, :formation_position_id => 5, :person_id => 15, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 23, :lineup_formation_id => 4, :formation_position_id => 5, :person_id => 16, :pos_rank => 3, :is_starter => TRUE}, 
# 	{:id => 24, :lineup_formation_id => 4, :formation_position_id => 5, :person_id => 17, :pos_rank => 4, :is_starter => TRUE}, 
# 	{:id => 25, :lineup_formation_id => 4, :formation_position_id => 5, :person_id => 18, :pos_rank => 5, :is_starter => TRUE}, 
# 	{:id => 26, :lineup_formation_id => 4, :formation_position_id => 6, :person_id => 19, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 27, :lineup_formation_id => 4, :formation_position_id => 6, :person_id => 20, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 28, :lineup_formation_id => 4, :formation_position_id => 6, :person_id => 21, :pos_rank => 3, :is_starter => TRUE}, 
# 	{:id => 29, :lineup_formation_id => 4, :formation_position_id => 6, :person_id => 22, :pos_rank => 4, :is_starter => TRUE}, 
# 	{:id => 30, :lineup_formation_id => 4, :formation_position_id => 6, :person_id => 23, :pos_rank => 5, :is_starter => TRUE}, 
# 	{:id => 31, :lineup_formation_id => 4, :formation_position_id => 4, :person_id => 30, :pos_rank => 2, :is_starter => FALSE}, 
# 	{:id => 32, :lineup_formation_id => 4, :formation_position_id => 5, :person_id => 31, :pos_rank => 6, :is_starter => FALSE}, 
# 	{:id => 33, :lineup_formation_id => 4, :formation_position_id => 5, :person_id => 32, :pos_rank => 7, :is_starter => FALSE}, 
# 	{:id => 34, :lineup_formation_id => 4, :formation_position_id => 5, :person_id => 40, :pos_rank => 8, :is_starter => FALSE}, 
# 	{:id => 35, :lineup_formation_id => 4, :formation_position_id => 5, :person_id => 41, :pos_rank => 9, :is_starter => FALSE}, 
# 	{:id => 36, :lineup_formation_id => 4, :formation_position_id => 5, :person_id => 42, :pos_rank => 10, :is_starter => FALSE}, 
# 	{:id => 37, :lineup_formation_id => 4, :formation_position_id => 5, :person_id => 43, :pos_rank => 11, :is_starter => FALSE}, 
# 	{:id => 38, :lineup_formation_id => 4, :formation_position_id => 5, :person_id => 44, :pos_rank => 12, :is_starter => FALSE}, 
# 	{:id => 39, :lineup_formation_id => 4, :formation_position_id => 6, :person_id => 33, :pos_rank => 6, :is_starter => FALSE}, 
# 	{:id => 40, :lineup_formation_id => 4, :formation_position_id => 6, :person_id => 34, :pos_rank => 7, :is_starter => FALSE}, 
# 	{:id => 41, :lineup_formation_id => 5, :formation_position_id => 7, :person_id => 24, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 42, :lineup_formation_id => 5, :formation_position_id => 7, :person_id => 25, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 43, :lineup_formation_id => 5, :formation_position_id => 7, :person_id => 26, :pos_rank => 3, :is_starter => TRUE}, 
# 	{:id => 44, :lineup_formation_id => 5, :formation_position_id => 7, :person_id => 27, :pos_rank => 4, :is_starter => TRUE}, 
# 	{:id => 45, :lineup_formation_id => 5, :formation_position_id => 7, :person_id => 28, :pos_rank => 5, :is_starter => TRUE}, 
# 	{:id => 46, :lineup_formation_id => 5, :formation_position_id => 7, :person_id => 29, :pos_rank => 6, :is_starter => TRUE}, 
# 	{:id => 47, :lineup_formation_id => 5, :formation_position_id => 8, :person_id => 30, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 48, :lineup_formation_id => 5, :formation_position_id => 8, :person_id => 31, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 49, :lineup_formation_id => 5, :formation_position_id => 8, :person_id => 32, :pos_rank => 3, :is_starter => TRUE}, 
# 	{:id => 50, :lineup_formation_id => 5, :formation_position_id => 9, :person_id => 33, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 51, :lineup_formation_id => 5, :formation_position_id => 9, :person_id => 34, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 52, :lineup_formation_id => 5, :formation_position_id => 7, :person_id => 41, :pos_rank => 7, :is_starter => FALSE}, 
# 	{:id => 53, :lineup_formation_id => 5, :formation_position_id => 7, :person_id => 42, :pos_rank => 8, :is_starter => FALSE}, 
# 	{:id => 54, :lineup_formation_id => 5, :formation_position_id => 7, :person_id => 43, :pos_rank => 9, :is_starter => FALSE}, 
# 	{:id => 55, :lineup_formation_id => 5, :formation_position_id => 8, :person_id => 44, :pos_rank => 4, :is_starter => FALSE}, 
# 	{:id => 56, :lineup_formation_id => 5, :formation_position_id => 9, :person_id => 45, :pos_rank => 3, :is_starter => FALSE}, 
# 	{:id => 57, :lineup_formation_id => 6, :formation_position_id => 10, :person_id => 35, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 58, :lineup_formation_id => 6, :formation_position_id => 11, :person_id => 36, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 59, :lineup_formation_id => 6, :formation_position_id => 12, :person_id => 37, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 60, :lineup_formation_id => 6, :formation_position_id => 13, :person_id => 38, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 61, :lineup_formation_id => 6, :formation_position_id => 14, :person_id => 39, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 62, :lineup_formation_id => 6, :formation_position_id => 15, :person_id => 40, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 63, :lineup_formation_id => 6, :formation_position_id => 16, :person_id => 41, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 64, :lineup_formation_id => 6, :formation_position_id => 17, :person_id => 42, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 65, :lineup_formation_id => 6, :formation_position_id => 17, :person_id => 43, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 66, :lineup_formation_id => 6, :formation_position_id => 18, :person_id => 44, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 67, :lineup_formation_id => 6, :formation_position_id => 18, :person_id => 45, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 68, :lineup_formation_id => 6, :formation_position_id => 10, :person_id => 48, :pos_rank => 2, :is_starter => FALSE}, 
# 	{:id => 69, :lineup_formation_id => 6, :formation_position_id => 11, :person_id => 49, :pos_rank => 2, :is_starter => FALSE}, 
# 	{:id => 70, :lineup_formation_id => 6, :formation_position_id => 12, :person_id => 50, :pos_rank => 2, :is_starter => FALSE}, 
# 	{:id => 71, :lineup_formation_id => 6, :formation_position_id => 13, :person_id => 51, :pos_rank => 2, :is_starter => FALSE}, 
# 	{:id => 72, :lineup_formation_id => 6, :formation_position_id => 14, :person_id => 52, :pos_rank => 2, :is_starter => FALSE}, 
# 	{:id => 73, :lineup_formation_id => 6, :formation_position_id => 17, :person_id => 53, :pos_rank => 3, :is_starter => FALSE}, 
# 	{:id => 74, :lineup_formation_id => 6, :formation_position_id => 18, :person_id => 54, :pos_rank => 3, :is_starter => FALSE}, 
# 	{:id => 75, :lineup_formation_id => 6, :formation_position_id => 18, :person_id => 55, :pos_rank => 4, :is_starter => FALSE}, 
# 	{:id => 76, :lineup_formation_id => 7, :formation_position_id => 19, :person_id => 46, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 77, :lineup_formation_id => 7, :formation_position_id => 19, :person_id => 47, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 78, :lineup_formation_id => 7, :formation_position_id => 20, :person_id => 48, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 79, :lineup_formation_id => 7, :formation_position_id => 20, :person_id => 49, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 80, :lineup_formation_id => 7, :formation_position_id => 21, :person_id => 50, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 81, :lineup_formation_id => 7, :formation_position_id => 22, :person_id => 51, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 82, :lineup_formation_id => 7, :formation_position_id => 23, :person_id => 52, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 83, :lineup_formation_id => 7, :formation_position_id => 23, :person_id => 53, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 84, :lineup_formation_id => 7, :formation_position_id => 24, :person_id => 54, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 85, :lineup_formation_id => 7, :formation_position_id => 24, :person_id => 55, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 86, :lineup_formation_id => 7, :formation_position_id => 25, :person_id => 56, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 87, :lineup_formation_id => 7, :formation_position_id => 19, :person_id => 35, :pos_rank => 3, :is_starter => FALSE}, 
# 	{:id => 88, :lineup_formation_id => 7, :formation_position_id => 20, :person_id => 36, :pos_rank => 3, :is_starter => FALSE}, 
# 	{:id => 89, :lineup_formation_id => 7, :formation_position_id => 20, :person_id => 37, :pos_rank => 4, :is_starter => FALSE}, 
# 	{:id => 90, :lineup_formation_id => 7, :formation_position_id => 21, :person_id => 38, :pos_rank => 2, :is_starter => FALSE}, 
# 	{:id => 91, :lineup_formation_id => 7, :formation_position_id => 22, :person_id => 39, :pos_rank => 2, :is_starter => FALSE}, 
# 	{:id => 92, :lineup_formation_id => 7, :formation_position_id => 23, :person_id => 40, :pos_rank => 3, :is_starter => FALSE}, 
# 	{:id => 93, :lineup_formation_id => 7, :formation_position_id => 23, :person_id => 41, :pos_rank => 4, :is_starter => FALSE}, 
# 	{:id => 94, :lineup_formation_id => 7, :formation_position_id => 24, :person_id => 42, :pos_rank => 3, :is_starter => FALSE}, 
# 	{:id => 95, :lineup_formation_id => 7, :formation_position_id => 24, :person_id => 43, :pos_rank => 4, :is_starter => FALSE}, 
# 	{:id => 96, :lineup_formation_id => 7, :formation_position_id => 24, :person_id => 44, :pos_rank => 5, :is_starter => FALSE}, 
# 	{:id => 97, :lineup_formation_id => 8, :formation_position_id => 26, :person_id => 58, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 98, :lineup_formation_id => 8, :formation_position_id => 27, :person_id => 59, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 99, :lineup_formation_id => 8, :formation_position_id => 28, :person_id => 60, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 100, :lineup_formation_id => 8, :formation_position_id => 29, :person_id => 61, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 101, :lineup_formation_id => 8, :formation_position_id => 30, :person_id => 62, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 102, :lineup_formation_id => 8, :formation_position_id => 31, :person_id => 63, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 103, :lineup_formation_id => 8, :formation_position_id => 32, :person_id => 64, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 104, :lineup_formation_id => 8, :formation_position_id => 33, :person_id => 65, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 105, :lineup_formation_id => 8, :formation_position_id => 33, :person_id => 66, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 106, :lineup_formation_id => 8, :formation_position_id => 34, :person_id => 67, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 107, :lineup_formation_id => 8, :formation_position_id => 34, :person_id => 68, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 108, :lineup_formation_id => 9, :formation_position_id => 35, :person_id => 70, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 109, :lineup_formation_id => 9, :formation_position_id => 35, :person_id => 71, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 110, :lineup_formation_id => 9, :formation_position_id => 36, :person_id => 72, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 111, :lineup_formation_id => 9, :formation_position_id => 36, :person_id => 73, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 112, :lineup_formation_id => 9, :formation_position_id => 37, :person_id => 74, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 113, :lineup_formation_id => 9, :formation_position_id => 37, :person_id => 75, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 114, :lineup_formation_id => 9, :formation_position_id => 38, :person_id => 76, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 115, :lineup_formation_id => 9, :formation_position_id => 38, :person_id => 77, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 116, :lineup_formation_id => 9, :formation_position_id => 39, :person_id => 78, :pos_rank => 1, :is_starter => TRUE}, 
# 	{:id => 117, :lineup_formation_id => 9, :formation_position_id => 39, :person_id => 79, :pos_rank => 2, :is_starter => TRUE}, 
# 	{:id => 118, :lineup_formation_id => 9, :formation_position_id => 40, :person_id => 80, :pos_rank => 1, :is_starter => TRUE}
# ].each do |attributes|
# 	LineupPlayer.where(id: attributes[:id]).first_or_create(attributes)
# end

# [
# 	{:id => 1, :name => "Offense", :team_role_id => 5}, 
# 	{:id => 2, :name => "Defense", :team_role_id => 6},
# 	{:id => 3, :name => "Kickoff", :team_role_id => 7}, 
# 	{:id => 4, :name => "Kickoff Return", :team_role_id => 7}, 
# 	{:id => 5, :name => "Field Goal", :team_role_id => 7}, 
# 	{:id => 6, :name => "Field Goal Block", :team_role_id => 7}, 
# 	{:id => 7, :name => "Punt", :team_role_id => 7}, 
# 	{:id => 8, :name => "Punt Return", :team_role_id => 7}
# ].each do |attributes|
# 	SportPlatoon.where(id: attributes[:id]).first_or_create(attributes)
# end

# [
# 	{:id => 3, :sport_platoon_id => 3, :competition_id => 1, :starting_lineup_formation_id => 4}, 
# 	{:id => 4, :sport_platoon_id => 4, :competition_id => 1, :starting_lineup_formation_id => 5},
# 	{:id => 5, :sport_platoon_id => 5, :competition_id => 1, :starting_lineup_formation_id => 6}, 
# 	{:id => 6, :sport_platoon_id => 6, :competition_id => 1, :starting_lineup_formation_id => 7}, 
# 	{:id => 7, :sport_platoon_id => 7, :competition_id => 1, :starting_lineup_formation_id => 8}, 
# 	{:id => 8, :sport_platoon_id => 8, :competition_id => 1, :starting_lineup_formation_id => 9}, 
# ].each do |attributes|
# 	LineupPlatoon.where(id: attributes[:id]).first_or_create(attributes)
# end