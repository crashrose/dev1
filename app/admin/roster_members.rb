ActiveAdmin.register CampaignUser, as: "RosterMember"  do

## Menu Options
  menu_options = {
    :label =>  'Team Members',
    :priority => 2
  }
  menu menu_options

  # @config.options = {:orig_scope => 'players'}
config.clear_action_items!
  navigation_menu :team

  controller do
    def scoped_collection
      # zzz
      #If the user has manually selected a campaign in the filters, clear the scope and set the campaign_id param to the filtered campaign
      # if params[:commit] == 'Filter' && params[:q][:campaign_id_eq] != nil
      #   CampaignUser.all
      #   # params[:campaign_id] = params[:q][:campaign_id_eq]
      # else
        #otherwise, use the campaign_id param to set the scope of the collection

        if params[:q] != nil
          #if campaign_id
          if params[:q][:campaign_id_eq] != nil
            CampaignUser.where(:campaign_id => params[:q][:campaign_id_eq]).includes(:positions, :campaign, :organization, :team_role_type, :person)
          else
            ####
            ####
            #### Be sure to update this to have the scope include the next or latest campaign
            CampaignUser.current_campaign.includes(:positions, :campaign, :organization, :team_role_type, :person)
          end
        else
          CampaignUser.current_campaign.includes( :positions, :campaign, :organization, :team_role_type, :person)
        end
      # end
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
    # helper :views
  end

# action_item only: :index do
#   link_to 'Manage a Different Season', admin_campaigns_path
# end

action_item only: :index do
  if params[:q] != nil
    #if campaign_id
    campaign = params[:q][:campaign_id_eq] != nil ? params[:q][:campaign_id_eq] : Campaign.current.first.id
      CampaignUser.where(:campaign_id => params[:q][:campaign_id_eq])
  else
    campaign = Campaign.current.first.id
  end
  link_to 'Add/Remove Roster Members', manage_roster_members_admin_campaign_path(campaign)
end

batch_action :set_position_for_players, if: proc { @current_scope.scope_method == :players }, form: ->{{position: Position.players.pluck(:title, :id)}} do |ids, inputs|
  ids = ids.map(&:to_i)
  campaign_users_to_add = ids - CampaignUserPosition.joins(:campaign_user).where(:campaign_user_id => ids, :position_id => inputs[:position]).pluck(:campaign_user_id)
  campaign_user_position_hash = campaign_users_to_add.map {|campaign_user_id| {:campaign_user_id => campaign_user_id, :position_id => inputs[:position]}}.flatten
  CampaignUserPosition.create([campaign_user_position_hash])
  redirect_to collection_url, :notice => "Positions were successfully updated."
end

batch_action :set_position_for_admins, if: proc { @current_scope.scope_method == :administrative_staff }, form: ->{{position: Position.admins.pluck(:title, :id)}} do |ids, inputs|
  ids = ids.map(&:to_i)
  campaign_users_to_add = ids - CampaignUserPosition.joins(:campaign_user).where(:campaign_user_id => ids, :position_id => inputs[:position]).pluck(:campaign_user_id)
  campaign_user_position_hash = campaign_users_to_add.map {|campaign_user_id| {:campaign_user_id => campaign_user_id, :position_id => inputs[:position]}}.flatten
  CampaignUserPosition.create([campaign_user_position_hash])
  redirect_to collection_url, :notice => "Positions were successfully updated."
end


batch_action :set_position_for_coaches, if: proc { @current_scope.scope_method == :coaching_staff }, form: ->{{position: Position.coaches.pluck(:title, :id)}} do |ids, inputs|
  ids = ids.map(&:to_i)
  campaign_users_to_add = ids - CampaignUserPosition.joins(:campaign_user).where(:campaign_user_id => ids, :position_id => inputs[:position]).pluck(:campaign_user_id)
  campaign_user_position_hash = campaign_users_to_add.map {|campaign_user_id| {:campaign_user_id => campaign_user_id, :position_id => inputs[:position]}}.flatten
  CampaignUserPosition.create([campaign_user_position_hash])
  redirect_to collection_url, :notice => "Positions were successfully updated."
end


batch_action :set_position_for_leadership, if: proc { @current_scope.scope_method == :leadership }, form: ->{{position: Position.leadership.pluck(:title, :id)}} do |ids, inputs|
  ids = ids.map(&:to_i)
  campaign_users_to_add = ids - CampaignUserPosition.joins(:campaign_user).where(:campaign_user_id => ids, :position_id => inputs[:position]).pluck(:campaign_user_id)
  campaign_user_position_hash = campaign_users_to_add.map {|campaign_user_id| {:campaign_user_id => campaign_user_id, :position_id => inputs[:position]}}.flatten
  CampaignUserPosition.create([campaign_user_position_hash])
  redirect_to collection_url, :notice => "Positions were successfully updated."
end

batch_action :set_position_for_operational, if: proc { @current_scope.scope_method == :operational_staff }, form: ->{{position: Position.operational.pluck(:title, :id)}} do |ids, inputs|
  ids = ids.map(&:to_i)
  campaign_users_to_add = ids - CampaignUserPosition.joins(:campaign_user).where(:campaign_user_id => ids, :position_id => inputs[:position]).pluck(:campaign_user_id)
  campaign_user_position_hash = campaign_users_to_add.map {|campaign_user_id| {:campaign_user_id => campaign_user_id, :position_id => inputs[:position]}}.flatten
  CampaignUserPosition.create([campaign_user_position_hash])
  redirect_to collection_url, :notice => "Positions were successfully updated."
end

batch_action :set_position_for_support, if: proc { @current_scope.scope_method == :support_staff }, form: ->{{position: Position.support.pluck(:title, :id)}} do |ids, inputs|
  ids = ids.map(&:to_i)
  campaign_users_to_add = ids - CampaignUserPosition.joins(:campaign_user).where(:campaign_user_id => ids, :position_id => inputs[:position]).pluck(:campaign_user_id)
  campaign_user_position_hash = campaign_users_to_add.map {|campaign_user_id| {:campaign_user_id => campaign_user_id, :position_id => inputs[:position]}}.flatten
  CampaignUserPosition.create([campaign_user_position_hash])
  redirect_to collection_url, :notice => "Positions were successfully updated."
end


  permit_params  :name, :start_date, :end_date

  # collection_action :manage_roster_members, :method => :post   do
  #   @form = Form.find(params[:id])
  #   # @submissions = FormSubmission.find_by form_id: params[:id]
  #   # # user.lock!
  #   # redirect_to {:action => :show},
  # end

  scope :players, :default => true
  scope :coaches
  scope :administrative_staff
  scope :leadership
  scope :operational_staff
  scope :support_staff
  # scope "All", :all_roster_members


  index do
    selectable_column
    column :person
    column 'Position(s)' do |roster_member|
      roster_member.positions.map { |position| position.abbreviation }.to_sentence.html_safe
    end
    actions
  end

  filter :campaign
  filter :person
  filter :positions
  # filter :created_at

  # form :options => {:orig_scope => proc { @current_scope.scope_method}} do |f|
  #   f.inputs "Roster Member Details" do
  #     f.input :name
  #     f.input :start_date
  #     f.input :end_date
  #   end
  #   f.actions
  # end

end
