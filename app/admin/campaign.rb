ActiveAdmin.register Campaign  do

  menu_options = {
    :label =>  'Manage Seasons',
    :priority => 20
  }
  menu menu_options

navigation_menu :team


  sidebar "Manage Campaign", only: [:show, :edit] do
    ul do
      li link_to "Team Members", admin_roster_members_path(:campaign_id => campaign.id)
      li link_to "Statistics", admin_roster_members_path(:campaign_id => campaign.id)
      li link_to "Schedule", admin_roster_members_path(:q => {:campaign_id => campaign.id})
    end
  end

  controller do
    def scoped_collection
      Campaign.all
    end

    helper :views

    def create
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
   
    def update
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end


    def manage_roster_members(campaign_id)
      @campaign = Campaign.find(campaign_id)
    end
  end

  permit_params  :name, :start_date, :end_date, player_ids: [], coach_ids: [], admin_ids: [], other_ids: [], team_role_ids: [], campaign_users_attributes: [ :user_id, :team_role_id, :campaign_id ]

scope :current
  scope :latest
  scope :upcoming

  index do
    selectable_column
    column :name
    column :start_date
    column :end_date
    column "Manage",  sortable: false do |campaign|
      link_to('Roster', admin_roster_members_path(:campaign_id => campaign.id)).html_safe  + ' ' +
      link_to('Schedule', admin_roster_members_path(:campaign_id => campaign.id)).html_safe  + ' ' +
      link_to('Statistics', admin_roster_members_path(:q => {:campaign_id_eq => campaign.id})).html_safe
    end
  end

  member_action :manage_roster_members, method: :get do
    @campaign = resource
    respond_with @campaign
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Campaign Details" do
      f.input :name
      f.input :start_date
      f.input :end_date
    end
    f.actions
  end

end
