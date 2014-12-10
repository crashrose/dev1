ActiveAdmin.register Platoon  do

  menu_options = {
    :label =>  'Platoons',
    :priority =>  18
  }
  menu menu_options
navigation_menu :team

  controller do
    def scoped_collection
      Platoon.all
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
    column :team_role
    column :starting_lineup_formation
    column 'Completion' do |platoon|
      platoon.starting_lineup_formation.lineup_players.count.to_s + '/' +
      platoon.starting_lineup_formation.formation.formation_positions.count.to_s + ' positions filled.'
    end
    column 'Pos Needed' do |platoon|
      
    end
    # column :sport
    # column :team_role
    # column :order_pos
    # column 'Children' do |position|
    #   Platoon.children.map { |child| child.abbreviation }.to_sentence.html_safe
    # end
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Platoon Details" do
      f.association :team_role
      f.association :competition
      f.association :starting_lineup_formation, collection: LineupFormation.by_team_role(f.object.team_role_id), include_blank: false
    end
    f.actions
  end

end
