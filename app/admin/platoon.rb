ActiveAdmin.register LineupFormation  do

  menu_options = {
    :label =>  'LineupFormations',
    :priority =>  18
  }
  menu menu_options
navigation_menu :team

  controller do
    def scoped_collection
      LineupFormation.all.includes(:lineup_platoon)
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

  permit_params  :name



  index do
    column :id
    column :formation
    # column :competition
    # column :platoon

    # column :sport
    # column :team_role
    # column :order_pos
    column 'Competition' do |lineup_formation|
      lineup_formation.lineup_platoon.competition.name
    end
    # column 'Lineup Platoon' do |lineup_formation|
    #   lineup_formation.lineup_platoon.sport_platoon.parent_id
    # end
    column 'Team Area' do |lineup_formation|
      lineup_formation.platoon_area.name if lineup_formation.platoon_area
    end

    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  # form do |f|
  #   f.inputs "LineupFormation Details" do
  #     f.association :team_role
  #     f.association :competition
  #     f.association :starting_lineup_formation, collection: LineupFormation.by_team_role(f.object.team_role_id), include_blank: false
  #   end
  #   f.actions
  # end

end
