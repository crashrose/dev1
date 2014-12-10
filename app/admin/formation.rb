ActiveAdmin.register Formation  do

  menu_options = {
    :label =>  'Formations',
    :priority =>  18
  }
  menu menu_options
navigation_menu :team

  controller do
    def scoped_collection
      Formation.all
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



  # index do
  #   selectable_column
  #   column :title
  #   column :abbreviation
  #   column :parent
  #   column :sport
  #   column :team_role
  #   column :order_pos
  #   column 'Children' do |position|
  #     Formation.children.map { |child| child.abbreviation }.to_sentence.html_safe
  #   end
  #   actions
  # end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Formation Details" do
      f.input :name
      f.association :team_role
    end
    f.actions
  end

end
