
namespace :app do

	desc "Populate the database with development data"

	task :populate => :environment do






[
	{:id => 4, :event_id => 5, :group_id => 2, :created_at => "2014-06-05 20:41:23", :updated_at => "2014-06-05 20:41:23"},
	{:id => 5, :event_id => 5, :group_id => 3, :created_at => "2014-06-05 20:41:23", :updated_at => "2014-06-05 20:41:23"},
	{:id => 17, :event_id => 10, :group_id => 1, :created_at => "2014-06-06 03:47:43", :updated_at => "2014-06-06 03:47:43"},
	{:id => 18, :event_id => 10, :group_id => 2, :created_at => "2014-06-06 03:47:43", :updated_at => "2014-06-06 03:47:43"},
	{:id => 19, :event_id => 11, :group_id => 3, :created_at => "2014-06-06 03:49:02", :updated_at => "2014-06-06 03:49:02"},
	{:id => 20, :event_id => 11, :group_id => 4, :created_at => "2014-06-06 03:49:02", :updated_at => "2014-06-06 03:49:02"},
	{:id => 21, :event_id => 11, :group_id => 1, :created_at => "2014-06-06 19:36:49", :updated_at => "2014-06-06 19:36:49"},
	{:id => 22, :event_id => 11, :group_id => 2, :created_at => "2014-06-06 19:36:49", :updated_at => "2014-06-06 19:36:49"},
	{:id => 23, :event_id => 5, :group_id => 4, :created_at => "2014-06-06 19:40:31", :updated_at => "2014-06-06 19:40:31"},
	{:id => 24, :event_id => 12, :group_id => 1, :created_at => "2014-06-18 04:54:57", :updated_at => "2014-06-18 04:54:57"},
	{:id => 25, :event_id => 12, :group_id => 2, :created_at => "2014-06-18 04:54:57", :updated_at => "2014-06-18 04:54:57"},
	{:id => 26, :event_id => 12, :group_id => 4, :created_at => "2014-06-18 04:54:57", :updated_at => "2014-06-18 04:54:57"},
	{:id => 29, :event_id => 15, :group_id => 2, :created_at => "2014-06-25 19:16:58", :updated_at => "2014-06-25 19:16:58"},
	{:id => 30, :event_id => 15, :group_id => 3, :created_at => "2014-06-25 19:16:58", :updated_at => "2014-06-25 19:16:58"}
		].each do |attributes|
			EventGroup.where(id: attributes[:id], event_id: attributes[:event_id], group_id: attributes[:group_id]).first_or_create(attributes)
		end



[
	{:id => 1, :title => "Practice", :position => 1, :created_at => "2014-05-30 15:47:31", :updated_at => "2014-06-02 17:56:43"},
	{:id => 2, :title => "Game", :position => 2, :created_at => "2014-05-30 15:47:31", :updated_at => "2014-05-30 15:47:31"},
	{:id => 3, :title => "Film Session", :position => 3, :created_at => "2014-05-30 15:47:31", :updated_at => "2014-05-30 15:47:31"},
	{:id => 4, :title => "Meeting", :position => 4, :created_at => "2014-05-30 15:47:31", :updated_at => "2014-05-30 15:47:31"},
	{:id => 5, :title => "Classroom Session", :position => 5, :created_at => "2014-05-30 15:47:31", :updated_at => "2014-05-30 15:47:31"},
	{:id => 6, :title => "Mini-Camp", :position => 6, :created_at => "2014-05-30 15:47:31", :updated_at => "2014-05-30 15:47:31"},
	{:id => 7, :title => "Scrimmage", :position => 7, :created_at => "2014-05-30 15:47:31", :updated_at => "2014-05-30 15:47:31"},
	{:id => 8, :title => "Meal", :position => 8, :created_at => "2014-05-30 15:47:31", :updated_at => "2014-05-30 15:47:31"},
	{:id => 9, :title => "Unknown", :position => 9, :created_at => "2014-05-30 15:47:31", :updated_at => "2014-05-30 15:47:31"},
	{:id => "14", :title => "Test Event Type 4", :position => 10, :created_at => "2014-06-03 02:51:10", :updated_at => "2014-06-03 02:51:10", :organization_id => 2}
].each do |attributes|
EventType.where(title: attributes[:title]).first_or_create(attributes)
end

[
	{:id => 1, :name => "playbook", :created_at => "2014-06-13 19:22:30", :updated_at => "2014-06-13 19:22:30"},
	{:id => 2, :name => "multimedia", :created_at => "2014-06-13 19:22:30", :updated_at => "2014-06-13 19:22:30"},
	{:id => 3, :name => "instructional", :created_at => "2014-06-13 19:22:30", :updated_at => "2014-06-13 19:22:30"},
	{:id => 4, :name => "resource", :created_at => "2014-06-13 19:22:30", :updated_at => "2014-06-13 19:22:30"},
	{:id => 5, :name => "import", :created_at => "2014-06-13 19:23:57", :updated_at => "2014-06-13 19:23:57"}
].each do |attributes|
			FileType.where(name: attributes[:name]).first_or_create(attributes)
		end



[
	{:id => 1, :name => "First Test Form", :organization_id => 2, :publish_results => 1, :email_results => 1, :email_to_address => "crashrose@gmail.com", :created_at => "2014-06-17 19:05:44", :updated_at => "2014-06-17 19:17:35"}
].each do |attributes|
			Form.where(name: attributes[:name], id: attributes[:id]).first_or_create(attributes)
		end



[
	{:id => 1, :name => "Test Field 1", :form_id => 1, :max_length => 20, :min_length => 0, :required => 1, :created_at => "2014-06-17 20:33:49", :updated_at => "2014-06-17 20:33:49"},
	{:id => 2, :name => "test field 2", :form_id => 1, :max_length => 1, :min_length => 2, :required => 1, :field_type => "string", :created_at => "2014-06-17 20:36:04", :updated_at => "2014-06-17 20:36:04"}
].each do |attributes|
			FormField.where(name: attributes[:name], id: attributes[:id]).first_or_create(attributes)
		end




[
	{:id => 35, :form_id => 1, :created_at => "2014-06-18 06:00:57", :updated_at => "2014-06-18 06:00:57"},
	{:id => 37, :form_id => 1, :created_at => "2014-06-18 06:13:50", :updated_at => "2014-06-18 06:13:50"},
	{:id => 39, :form_id => 1, :created_at => "2014-06-18 15:40:43", :updated_at => "2014-06-18 15:40:43"},
	{:id => 41, :form_id => 1, :created_at => "2014-06-18 15:45:10", :updated_at => "2014-06-18 15:45:10"}
].each do |attributes|
			FormSubmission.where( id: attributes[:id]).first_or_create(attributes)
		end



[
	{:id => 5, :form_submission_id => 35, :form_field_id => 1, :form_field_value => "test val 1", :created_at => "2014-06-18 06:00:57", :updated_at => "2014-06-18 06:00:57"},
	{:id => 6, :form_submission_id => 35, :form_field_id => 2, :form_field_value => "test_val 2", :created_at => "2014-06-18 06:00:57", :updated_at => "2014-06-18 06:00:57"},
	{:id => 9, :form_submission_id => 37, :form_field_id => 1, :form_field_value => "test val 1 b", :created_at => "2014-06-18 06:13:50", :updated_at => "2014-06-18 06:13:50"},
	{:id => 10, :form_submission_id => 37, :form_field_id => 2, :form_field_value => "test_val 2 b", :created_at => "2014-06-18 06:13:50", :updated_at => "2014-06-18 06:13:50"},
	{:id => 15, :form_submission_id => 39, :form_field_id => 1, :form_field_value => "test val 1 c", :created_at => "2014-06-18 15:40:43", :updated_at => "2014-06-18 15:40:43"},
	{:id => 16, :form_submission_id => 39, :form_field_id => 2, :form_field_value => "test val 2 c", :created_at => "2014-06-18 15:40:43", :updated_at => "2014-06-18 15:40:43"},
	{:id => 19, :form_submission_id => 41, :form_field_id => 1, :form_field_value => "test val 1 d", :created_at => "2014-06-18 15:45:10", :updated_at => "2014-06-18 15:45:10"},
	{:id => 20, :form_submission_id => 41, :form_field_id => 2, :form_field_value => "test_val 2 d", :created_at => "2014-06-18 15:45:10", :updated_at => "2014-06-18 15:45:10"}
].each do |attributes|
			FormSubmissionItem.where( id: attributes[:id]).first_or_create(attributes)
		end



[
	{:id => 1, :name => "Rookies", :created_at => "2014-05-30 16:09:26", :updated_at => "2014-05-30 16:09:26", :organization_id => 2},
	{:id => 2, :name => "Vets", :created_at => "2014-05-30 16:09:26", :updated_at => "2014-05-30 16:09:26", :organization_id => 2},
	{:id => 3, :name => "Coaches", :created_at => "2014-05-30 16:09:26", :updated_at => "2014-05-30 16:09:26", :organization_id => 2},
	{:id => 4, :name => "Administrators", :created_at => "2014-05-30 16:09:27", :updated_at => "2014-05-30 16:09:27", :organization_id => 2}
].each do |attributes|
			Group.where(name: attributes[:name]).first_or_create(attributes)
		end




[
	{:id => 1, :group_id => 4, :payment_id => 1}
].each do |attributes|
			GroupPayment.where(group_id: attributes[:group_id], payment_id: attributes[:payment_id]).first_or_create(attributes)
		end



[
	{:id => 1, :user_id => 1, :group_id => 1, :created_at => "2014-05-30 16:09:27", :updated_at => "2014-05-30 16:09:27"},
	{:id => 2, :user_id => 2, :group_id => 2, :created_at => "2014-05-30 16:09:27", :updated_at => "2014-05-30 16:09:27"},
	{:id => 3, :user_id => 3, :group_id => 3, :created_at => "2014-05-30 16:09:27", :updated_at => "2014-05-30 16:09:27"},
	{:id => 4, :user_id => 4, :group_id => 4, :created_at => "2014-05-30 16:09:27", :updated_at => "2014-05-30 16:09:27"},
	{:id => 5, :user_id => 5, :group_id => 4, :created_at => "2014-05-30 16:09:27", :updated_at => "2014-05-30 16:09:27"},
	{:id => 6, :user_id => 2, :group_id => 4}
		].each do |attributes|
			GroupsUser.where(user_id: attributes[:user_id], group_id: attributes[:group_id]).first_or_create(attributes)
		end



[
	{:id => 31, :organization_id => 2, :g_cal_id => "6cvvqvscutpcome5f6j58v5rqs@group.calendar.google.com", :created_at => "2014-07-07 18:21:53", :updated_at => "2014-07-07 18:27:00", :active => 0, :timezone => "America\/New_York"},
	{:id => 32, :organization_id => 2, :g_cal_id => "oq7drsn9217joc7o2jkijoqe4s@group.calendar.google.com", :created_at => "2014-07-07 18:27:00", :updated_at => "2014-07-07 18:31:22", :active => 0, :timezone => "America\/New_York"},
	{:id => 33, :organization_id => 2, :g_cal_id => "tnla9nhvu406ru9ceo61eqgjb8@group.calendar.google.com", :created_at => "2014-07-07 18:31:22", :updated_at => "2014-07-07 18:31:22", :active => 1, :timezone => "America\/New_York"}
		].each do |attributes|
			GCal.where(id: attributes[:id], g_cal_id: attributes[:g_cal_id]).first_or_create(attributes)
		end


[
	{:id => 1, :name => "Unknown", :address1 => "", :address2 => "", :city => "", :state => "", :country => "", :phone => "", :note => "", :website => "", :maplink => "", :updated_at => "2014-06-12 18:45:34", :organization_id => 2},
	{:id => 4, :name => "Test Location 1", :address1 => "", :address2 => "", :city => "", :state => "", :country => "", :phone => "", :note => "", :website => "", :maplink => "", :created_at => "2014-06-05 16:29:43", :updated_at => "2014-06-05 16:29:43", :organization_id => 2},
	{:id => 5, :name => "Location Test 2", :address1 => "", :address2 => "", :city => "", :state => "", :country => "", :phone => "", :note => "", :website => "", :maplink => "", :created_at => "2014-06-12 18:26:09", :updated_at => "2014-06-12 18:26:09", :organization_id => 2}
].each do |attributes|
			Location.where(id: attributes[:id], name: attributes[:name]).first_or_create(attributes)
		end



[
	{:id => 1, :name => "global", :owner_id => 1, :org_type_id => 1, :parent_id => 1, :created_at => "2014-06-13 19:23:57", :updated_at => "2014-06-13 19:23:57"},
	{:id => 2, :name => "Sharks", :owner_id => 2, :org_type_id => 3, :parent_id => 3, :created_at => "2014-06-13 19:23:57", :updated_at => "2014-06-13 19:23:57", :paypal_seller_id => "dev-user@teamrockett.com"},
	{:id => 3, :name => "IWFL", :owner_id => 3, :org_type_id => 2, :parent_id => 1, :created_at => "2014-06-13 19:23:57", :updated_at => "2014-06-13 19:23:57"},
	{:id => 4, :name => "Sharks 2014", :owner_id => 2, :org_type_id => 4, :parent_id => 2, :created_at => "2014-06-13 19:23:57", :updated_at => "2014-06-13 19:23:57"},
	{:id => 5, :name => "Divas", :owner_id => 4, :org_type_id => 3, :parent_id => 1, :created_at => "2014-06-13 19:23:57", :updated_at => "2014-06-13 19:23:57"}
].each do |attributes|
			Organization.where(name: attributes[:name], org_type_id: attributes[:org_type_id]).first_or_create(attributes)
		end



[
	{:id => 1, :title => "global", :created_at => "2014-06-13 19:23:57", :updated_at => "2014-06-13 19:23:57"},
	{:id => 2, :title => "League", :created_at => "2014-06-13 19:23:57", :updated_at => "2014-06-13 19:23:57"},
	{:id => 3, :title => "Team", :created_at => "2014-06-13 19:23:57", :updated_at => "2014-06-13 19:23:57"},
	{:id => 4, :title => "Season", :created_at => "2014-06-13 19:23:57", :updated_at => "2014-06-13 19:23:57"}
].each do |attributes|
			OrgType.where(title: attributes[:title]).first_or_create(attributes)
		end



[
	{:id => 1, :name => "test1", :owner_id => 1, :amount => 50.00, :organization_id => 2, :description => "test1", :position => 1, :status => "open"}
].each do |attributes|
			Payment.where(name: attributes[:name]).first_or_create(attributes)
		end


		[
			{:id => 1, :user_id => 1, :first_name => "Darth", :last_name => "Vader"},
			{:id => 2, :user_id => 2, :first_name => "Commander", :last_name => "Praji"},
			{:id => 3, :user_id => 3, :first_name => "Biggs", :last_name => "Darkwater"},
			{:id => 4, :user_id => 4, :first_name => "Luke", :last_name => "Skywalker"},
			{:id => 5, :user_id => 5, :first_name => "Han", :last_name => "Solo"},
			{:id => 6, :user_id => 0, :first_name => "Biggs", :last_name => "Darklighter"}
		].each do |attributes|
			Person.where(first_name: attributes[:first_name], last_name: attributes[:last_name]).first_or_create(attributes)
		end


		# [
		# 	{:first_name => "Darth", :last_name => "Vader"},
		# 	{:first_name => "Commander", :last_name => "Praji"},
		# 	{:first_name => "Biggs", :last_name => "Darklighter"},
		# 	{:first_name   => "Luke", :last_name => "Skywalker"},
		# 	{:first_name => "Han", :last_name => "Solo"}
		# ].each do |attributes|
		# 	Person.where(first_name: attributes[:first_name], last_name: attributes[:last_name]).first_or_create(attributes)
		# end
		[
			{:id => 5, :name => "Event Test 1", :starts_at => "2011-04-03 13:00:00", :event_type_id => 3, :location_id => 1, :owner_id => 3, :respond_by => "2011-03-03 00:00:00", :ends_at => "2011-04-05 13:00:00", :organization_id => 2},
			{:id => 10, :name => "test event 3", :starts_at => "2014-12-31 09:59:00", :event_type_id => 14, :location_id => 4, :owner_id => 1, :respond_by => "2014-12-31 12:59:59", :ends_at => "2015-01-02 09:59:00", :organization_id => 2},
			{:id => 11, :name => "test event 4", :starts_at => "2015-12-30 09:28:59", :event_type_id => 6, :location_id => 5, :owner_id => 2, :respond_by => "2015-12-29 12:59:58", :ends_at => "2016-01-01 09:28:59", :organization_id => 2},
			{:id => 12, :name => "test 6", :starts_at => "2014-01-01 18:00:00", :event_type_id => 1, :location_id => 1, :owner_id => 1, :respond_by => "2014-12-31 17:59:59", :ends_at => "2014-01-03 20:00:00", :organization_id => 2},
			{:id => 15, :name => "test event 6", :starts_at => "2014-06-26 17:00:00", :event_type_id => 2, :location_id => 1, :owner_id => 1, :respond_by => "2014-06-26 03:59:59", :ends_at => "2014-06-28 19:00:00", :organization_id => 2}
		].each do |attributes|
			Event.where(id: attributes[:id]).first_or_create(attributes)
		end




[
	{:id => 1, :action => "update", :organization_id => 2, :subject_class => "Event", :action_scope => "all", :created_at => "2014-06-13 19:24:57", :updated_at => "2014-06-13 19:24:57"},
	{:id => 2, :action => "update", :organization_id => 5, :subject_class => "Response", :action_scope => "own", :created_at => "2014-06-13 19:24:57", :updated_at => "2014-06-13 19:24:57"},
	{:id => 3, :action => "create", :organization_id => 5, :subject_class => "Response", :action_scope => "own", :created_at => "2014-06-13 19:24:57", :updated_at => "2014-06-13 19:24:57"},
	{:id => 4, :action => "view", :organization_id => 5, :subject_class => "Event", :action_scope => "all", :created_at => "2014-06-13 19:24:57", :updated_at => "2014-06-13 19:24:57"},
	{:id => 5, :action => "manage", :organization_id => 1, :subject_class => "Location", :action_scope => "all", :created_at => "2014-06-13 19:24:57", :updated_at => "2014-06-13 19:24:57"}
].each do |attributes|
	Permission.where(action: attributes[:action], organization_id: attributes[:organization_id], subject_class: attributes[:subject_class], action_scope: attributes[:action_scope]).first_or_create(attributes)
end



[
	{:id => 273, :response_reason_id => 2, :response_status_id => 2, :event_id => 5, :user_id => 2, :details => "test1", :active => false, :event_user_id => "5_2", :created_at => "2014-06-12 04:54:27", :updated_at => "2014-06-12 04:55:11"},
	{:id => 274, :response_reason_id => 3, :response_status_id => 3, :event_id => 5, :user_id => 3, :details => "test2", :active => false, :event_user_id => "5_3", :created_at => "2014-06-12 04:54:27", :updated_at => "2014-06-12 04:55:11"},
	{:id => 275, :response_reason_id => 2, :response_status_id => 2, :event_id => 5, :user_id => 2, :details => "test1DetilsChg1", :active => false, :event_user_id => "5_2", :created_at => "2014-06-12 04:55:11", :updated_at => "2014-06-12 16:07:45"},
	{:id => 276, :response_reason_id => 3, :response_status_id => 3, :event_id => 5, :user_id => 3, :details => "test2", :active => false, :event_user_id => "5_3", :created_at => "2014-06-12 04:55:11", :updated_at => "2014-06-12 16:07:45"},
	{:id => 277, :response_reason_id => 2, :response_status_id => 2, :event_id => 5, :user_id => 2, :details => "test1DetilsChg1", :active => false, :event_user_id => "5_2", :created_at => "2014-06-12 16:07:45", :updated_at => "2014-06-12 16:15:27"},
	{:id => 278, :response_reason_id => 3, :response_status_id => 3, :event_id => 5, :user_id => 3, :details => "test2", :active => true, :event_user_id => "5_3", :created_at => "2014-06-12 16:07:45", :updated_at => "2014-06-12 16:07:45"},
	{:id => 279, :response_reason_id => 4, :response_status_id => 4, :event_id => 10, :user_id => 1, :details => "", :active => false, :event_user_id => "10_1", :created_at => "2014-06-12 16:07:45", :updated_at => "2014-06-12 17:05:40"},
	{:id => 280, :response_reason_id => 2, :response_status_id => 2, :event_id => 5, :user_id => 2, :details => "test1DetilsChg2", :active => false, :event_user_id => "5_2", :created_at => "2014-06-12 16:15:27", :updated_at => "2014-06-12 16:16:41"},
	{:id => 281, :response_reason_id => 2, :response_status_id => 2, :event_id => 5, :user_id => 2, :details => "test1DetilsChg3", :active => true, :event_user_id => "5_2", :created_at => "2014-06-12 16:16:41", :updated_at => "2014-06-12 16:16:41"},
	{:id => 282, :response_reason_id => 4, :response_status_id => 4, :event_id => 10, :user_id => 1, :details => "addtext", :active => true, :event_user_id => "10_1", :created_at => "2014-06-12 17:05:40", :updated_at => "2014-06-12 17:05:40"}
].each do |attributes|
	Response.where(event_user_id: attributes[:event_user_id], active: attributes[:active]).first_or_create(attributes)
end


[
	{:id => 1, :title => "Work", :position => 1, :created_at => "2014-05-30 15:47:30", :updated_at => "2014-05-30 15:47:30"},
	{:id => 2, :title => "Family Event", :position => 2, :created_at => "2014-05-30 15:47:30", :updated_at => "2014-05-30 15:47:30"},
	{:id => 3, :title => "Doctor Appointment", :position => 3, :created_at => "2014-05-30 15:47:30", :updated_at => "2014-05-30 15:47:30"},
	{:id => 4, :title => "School", :position => 4, :created_at => "2014-05-30 15:47:30", :updated_at => "2014-05-30 15:47:30"},
	{:id => 5, :title => "Other Sport", :position => 5, :created_at => "2014-05-30 15:47:30", :updated_at => "2014-05-30 15:47:30"},
	{:id => 6, :title => "Not Listed", :position => 6, :created_at => "2014-05-30 15:47:30", :updated_at => "2014-05-30 15:47:30"}
].each do |attributes|
	ResponseReason.where(title: attributes[:title]).first_or_create(attributes)
end


[
	{:id => 1, :title => "No Response",  :position => 1, :created_at => "2014-05-30 15:47:30", :updated_at => "2014-05-30 15:47:30"},
	{:id => 2, :title => "Unsure", :text => "Unsure", :position => 2, :created_at => "2014-05-30 15:47:30", :updated_at => "2014-05-30 15:47:30"},
	{:id => 3, :title => "Yes", :text => "Attending", :position => 3, :created_at => "2014-05-30 15:47:30", :updated_at => "2014-05-30 15:47:30"},
	{:id => 4, :title => "No", :text => "Not Attending", :position => 4, :created_at => "2014-05-30 15:47:30", :updated_at => "2014-05-30 15:47:30"}
].each do |attributes|
	ResponseStatus.where(title: attributes[:title]).first_or_create(attributes)
end


[
	{:id => 1, :title => "Awaiting Approval", :position => 1, :created_at => "2014-05-30 15:47:30", :updated_at => "2014-05-30 15:47:30"},
	{:id => 2, :title => "Approved", :text => "Approve", :position => 2, :created_at => "2014-05-30 15:47:30", :updated_at => "2014-05-30 15:47:30"},
	{:id => 3, :title => "Rejected", :text => "Reject", :position => 3, :created_at => "2014-05-30 15:47:30", :updated_at => "2014-05-30 15:47:30"}
].each do |attributes|
	ReviewStatus.where(title: attributes[:title]).first_or_create(attributes)
end


[
	{:id => 1, :created_at => "2014-05-30 16:09:26", :updated_at => "2014-05-30 16:09:26", :email => 1, :encrypted_password => "", :sign_in_count => 0, :person_id => 1, :failed_attempts => 0},
	{:id => 2, :created_at => "2014-05-30 16:09:26", :updated_at => "2014-05-30 16:09:26", :email => 2, :encrypted_password => "", :sign_in_count => 0, :person_id => 2, :failed_attempts => 0},
	{:id => 3, :created_at => "2014-05-30 16:09:26", :updated_at => "2014-05-30 16:09:26", :email => 3, :encrypted_password => "", :sign_in_count => 0, :person_id => 3, :failed_attempts => 0},
	{:id => 4, :created_at => "2014-05-30 16:09:26", :updated_at => "2014-05-30 16:09:26", :email => 4, :encrypted_password => "", :sign_in_count => 0, :person_id => 4, :failed_attempts => 0},
	{:id => 5, :created_at => "2014-05-30 16:09:26", :updated_at => "2014-05-30 16:09:26", :email => 5, :encrypted_password => "", :sign_in_count => 0, :person_id => 5, :failed_attempts => 0},
	{:id => 7, :created_at => "2014-07-15 19:00:22", :updated_at => "2014-07-17 02:46:55", :email => "katherinelrose@hotmail.com", :encrypted_password => "$2a$10$8iuQDCdXNDTBc\/9GS\/GPGOrlTGfhqG3Ho2PN5NKLGR4skvpNi6gdi", :sign_in_count => 10, :current_sign_in_at => "2014-07-17 02:46:55", :last_sign_in_at => "2014-07-16 18:56:34", :current_sign_in_ip => "127.0.0.1", :last_sign_in_ip => "127.0.0.1", :failed_attempts => 0}
].each do |attributes|
	User.where(id: attributes[:id]).first_or_create(attributes)
end


#####################
#########################




		# [
		# 	{:first_name => "Darth", :last_name => "Vader"},
		# 	{:first_name => "Commander", :last_name => "Praji"},
		# 	{:first_name => "Biggs", :last_name => "Darklighter"},
		# 	{:first_name   => "Luke", :last_name => "Skywalker"},
		# 	{:first_name => "Han", :last_name => "Solo"}
		# ].each do |attributes|
		# 	Person.where(first_name: attributes[:first_name], last_name: attributes[:last_name]).first_or_create(attributes)
		# end

# 		[
# 			{:name => "Rookies", :organization_id => 2},
# 			{:name => "Vets", :organization_id => 2},
# 			{:name => "Coaches", :organization_id => 2},
# 			{:name   => "Administrators", :organization_id => 2}
# 		].each do |attributes|
# 			Group.where(name: attributes[:name]).first_or_create(attributes)
# 		end


# 		[
# 			{:user_id => 1, :group_id => 1},
# 			{:user_id => 2, :group_id => 2},
# 			{:user_id => 3, :group_id => 3},
# 			{:user_id => 4, :group_id => 4},
# 			{:user_id => 5, :group_id => 4}
# 		].each do |attributes|
# 			GroupsUser.where(user_id: attributes[:user_id], group_id: attributes[:group_id]).first_or_create(attributes)
# 		end

# 		[
# 			{:name => "playbook"},
# 			{:name => "multimedia"},
# 			{:name => "instructional"},
# 			{:name => "import"},
# 			{:name => "resource"}
# 		].each do |attributes|
# 			FileType.where(name: attributes[:name]).first_or_create(attributes)
# 		end

# 		[
# 			{:title => "global"},
# 			{:title => "League"},
# 			{:title => "Team"},
# 			{:title => "Season"}
# 		].each do |attributes|
# 			OrgType.where(title: attributes[:title]).first_or_create(attributes)
# 		end

# [
# 	{:action => "update", :organization_id => 2, :subject_class => "Event", :action_scope => "all"},
# 	{:action => "update", :organization_id => 5, :subject_class => "Response", :action_scope => "own"},
# 	{:action => "create", :organization_id => 5, :subject_class => "Response", :action_scope => "own"},
# 	{:action => "view", :organization_id => 5, :subject_class => "Event", :action_scope => "all"},
# 	{:action => "manage", :organization_id => 1, :subject_class => "Location", :action_scope => "all"}
# ].each do |attributes|
# 	Permission.where(action: attributes[:action], organization_id: attributes[:organization_id], subject_class: attributes[:subject_class], action_scope: attributes[:action_scope]).first_or_create(attributes)
# end
# 		[
# 			{:name => "global", :owner_id => 1, :org_type_id => 1, :parent_id => 1},
# 			{:name => "Sharks", :owner_id => 2, :org_type_id => 3, :parent_id => 3},
# 			{:name => "IWFL", :owner_id => 3, :org_type_id => 2, :parent_id => 1},
# 			{:name => "Sharks 2014", :owner_id => 2, :org_type_id => 4, :parent_id => 2},
# 			{:name => "Divas", :owner_id => 4, :org_type_id => 3, :parent_id => 1}
# 		].each do |attributes|
# 			Organization.where(name: attributes[:name], org_type_id: attributes[:org_type_id]).first_or_create(attributes)
# 		end

# 		[
# 			{:action => "update", :organization_id => 2, :subject_class => "Event", :action_scope => "all"},
# 			{:action => "update", :organization_id => 5, :subject_class => "Response", :action_scope => "own"},
# 			{:action => "create", :organization_id => 5, :subject_class => "Response", :action_scope => "own"},
# 			{:action => "view", :organization_id => 5, :subject_class => "Event", :action_scope => "all"},
# 			{:action => "manage", :organization_id => 1, :subject_class => "Location", :action_scope => "all"}
# 		].each do |attributes|
# 			Permission.where(action: attributes[:action], organization_id: attributes[:organization_id], subject_class: attributes[:subject_class], action_scope: attributes[:action_scope]).first_or_create(attributes)
# 		end
	end
end