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



[
	{:id => 1, :position_id => 76, :formation_id => 1},
	{:id => 2, :position_id => 76, :formation_id => 1},
	{:id => 3, :position_id => 76, :formation_id => 1},
	{:id => 4, :position_id => 76, :formation_id => 1},
	{:id => 5, :position_id => 76, :formation_id => 1},
	{:id => 6, :position_id => 76, :formation_id => 1},
	{:id => 7, :position_id => 76, :formation_id => 1},
	{:id => 8, :position_id => 76, :formation_id => 1},
	{:id => 9, :position_id => 76, :formation_id => 1},
	{:id => 10, :position_id => 76, :formation_id => 1},
	{:id => 11, :position_id => 76, :formation_id => 1},
	{:id => 12, :position_id => 77, :formation_id => 2},
	{:id => 13, :position_id => 77, :formation_id => 2},
	{:id => 14, :position_id => 77, :formation_id => 2},
	{:id => 15, :position_id => 77, :formation_id => 2},
	{:id => 16, :position_id => 77, :formation_id => 2},
	{:id => 17, :position_id => 77, :formation_id => 2},
	{:id => 18, :position_id => 77, :formation_id => 2},
	{:id => 19, :position_id => 77, :formation_id => 2},
	{:id => 20, :position_id => 77, :formation_id => 2},
	{:id => 21, :position_id => 77, :formation_id => 2},
	{:id => 22, :position_id => 77, :formation_id => 2},
	{:id => 23, :position_id => 78, :formation_id => 3},
	{:id => 24, :position_id => 78, :formation_id => 3},
	{:id => 25, :position_id => 78, :formation_id => 3},
	{:id => 26, :position_id => 78, :formation_id => 3},
	{:id => 27, :position_id => 78, :formation_id => 3},
	{:id => 28, :position_id => 78, :formation_id => 3},
	{:id => 29, :position_id => 78, :formation_id => 3},
	{:id => 30, :position_id => 78, :formation_id => 3},
	{:id => 31, :position_id => 78, :formation_id => 3},
	{:id => 32, :position_id => 78, :formation_id => 3},
	{:id => 33, :position_id => 78, :formation_id => 3}
 ].each do |attributes|
	FormationPosition.where(id: attributes[:id]).first_or_create(attributes)
end