ActiveAdmin.register Position  do

  menu_options = {
    :label =>  'Positions',
    :priority =>  18
  }
  menu menu_options
navigation_menu :team

  controller do
    def scoped_collection
      Position.all
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

  permit_params  :name, :start_date, :end_date



  index do
    selectable_column
    column :title
    column :abbreviation
    column :parent
    column :sport
    column :team_role
    column :order_pos
    column 'Children' do |position|
      position.children.map { |child| child.abbreviation }.to_sentence.html_safe
    end
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  # form do |f|
  #   f.inputs "Position Details" do
  #     f.input :name
  #     f.input :start_date
  #     f.input :end_date
  #   end
  #   f.actions
  # end

end
