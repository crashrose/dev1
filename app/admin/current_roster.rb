# ActiveAdmin.register CampaignUser, as: "CurrentRosterMember"  do


# ## Menu Options
#   menu_options = {
#     :label =>  'Current Roster',
#     :priority => 2
#   }
#   menu menu_options

#   navigation_menu :team

#   controller do
#     def scoped_collection
#         CampaignUser.current_campaign
#     end

#     helper :views

#     def create
#       super do |format|
#         redirect_to collection_url and return if resource.valid?
#       end
#     end
   
#     def update
#       super do |format|
#         redirect_to collection_url and return if resource.valid?
#       end
#     end
#     # helper :views
#   end

#   permit_params  :name, :start_date, :end_date

#   scope :players, :default => true
#   scope :coaching_staff
#   scope :administrative_staff
#   scope :other_team_members
#   # scope "All", :all_roster_members


#   index do
#     selectable_column
#     column :user
#     column :team_role
#     # column :campaign
#     actions
#   end

#   # filter :email
#   # filter :current_sign_in_at
#   # filter :sign_in_count
#   # filter :created_at

#   form do |f|
#     f.inputs "Roster Member Details" do
#       f.input :name
#       f.input :start_date
#       f.input :end_date
#     end
#     f.actions
#   end

# end
