ActiveAdmin.register Response, as: 'AttendanceApproval'  do

## Menu Options
  menu_options = {
    :label =>  'Attendance'
  }
  menu menu_options

### Set to Approval Menu
  navigation_menu :approve

### Define available actions
actions :index, :show

### Scopes
  scope :awaiting_approval, :default => true
  scope :approved
  scope :rejected 
  scope "All", :all_not_attending


### Filters
  filter :attendee
  filter :event
  filter :event_type
  filter :location
  # filter :review_status
  filter :response_reason
  filter :event_starts_at, :as => :date_range
  filter :event_ends_at, :as => :date_range

### Set up sidebar if necessary
# sidebar :help, priority: 0 do
#   "Need help? Email us at help@example.com"
# end

### Default to sort by event start date
  config.sort_order = 'events.starts_at_asc'

### Setting scope to only those that need approval (may not be necessary since it's in the scpped_collection method)
  # scope_to do
  #   Class.new do
  #     def self.approve_attendances
  #       Response.all_not_attending
  #     end
  #   end
  # end

### Set default scope and have attributes eager loaded for sorting
  controller do
    def scoped_collection
      Response.all_not_attending.includes :attendee, :event, :response_reason, :review_status, :event_type # prevents N+1 queries to your database
      # super.includes :event # prevents N+1 queries to your database
      # super.includes :response_reason # prevents N+1 queries to your database
      # # super.includes :response_status # prevents N+1 queries to your database
      # super.includes :event_type # prevents N+1 queries to your database
    end
  end

### Column layout
  index do
    selectable_column
    column :attendee,:sortable => :"people.first_name"
    column :event, sortable: 'events.name'
    column "Event Start", sortable: 'events.starts_at' do |response|
      response.event.starts_at.strftime("%m/%d/%Y %l:%M %p")
    end
    column :event_type, sortable: 'event_types.title'
    column :response_reason, sortable: 'response_reasons.title'
    # column :details, sortable: false
    # column :review_status, sortable: 'review_statuses.title'
    column "Status",  sortable: 'review_statuses.title' do |response|
      case response.review_status.title # a_variable is the variable we want to compare
        when "Awaiting Approval"    #compare to 1
          text_node '<span class="label label-info">'.html_safe+response.review_status.title+'</span>'.html_safe
        when "Approved"    #compare to 2
          text_node '<span class="label label-success">'.html_safe+response.review_status.title+'</span>'.html_safe
        when "Rejected"    #compare to 2
          text_node '<span class="label label-danger">'.html_safe+response.review_status.title+'</span>'.html_safe
        else
          response.review_status.title
      end
    end
    actions do |response|
      case response.review_status.title # a_variable is the variable we want to compare
        # when "Awaiting Approval"    #compare to 1
        #   text_node '<span class="label label-info">'.html_safe+response.review_status.title+'</span>'.html_safe
        when "Approved"    #compare to 2
          link_to "Reject", reject_admin_attendance_approval_path(:id => response.id, :scope => params[:scope]) #, {:scope => params[:scope]}
        when "Rejected"    #compare to 2
          link_to "Approve", approve_admin_attendance_approval_path(:id => response.id, :scope => params[:scope])
        else
          link_to("Approve", approve_admin_attendance_approval_path(:id => response.id, :scope => params[:scope]))+' '+link_to("Reject", reject_admin_attendance_approval_path(:id => response.id, :scope => params[:scope]))
      end
      
      
    end

  end


### Single member actions
  member_action :approve do 
    # response = Response.find(params[:id])
    # redirect_scope = 
    Response.approval_change "Approve", params[:id]
    redirect_to collection_path(:scope => params[:scope]), :notice => "Response approved."
  end

  member_action :reject do 
    # @form = Form.find(params[:id])
    # redirect_scope = 
    Response.approval_change "Reject", params[:id]
    redirect_to collection_path(:scope => params[:scope]), :notice => "Response rejected."
  end


### Batch Actions
  batch_action :approve_all do |selection|
    Response.approval_change "Approve", selection
    redirect_to collection_path, :notice => "Responses approved."
  end

  batch_action :reject_all do |selection|
    Response.approval_change "Reject", selection
    redirect_to collection_path, :notice => "Responses rejected."
  end

  batch_action :destroy, false

end
