ActiveAdmin.register Group, menu_name: :configure  do

  navigation_menu :configure

  permit_params :name, :description, user_ids: [], group_users_attributes: [ :user_id, :group_id ]

  index do
    column :name, sortable: false
    column :description, sortable: false
    column "Members" do |group|
      group.users.count
    end
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
    end
    f.inputs 'Members' do
      f.select :user_ids, User.all_people.collect {|x| [x.name, x.id]}, {}, :multiple => true
    end
    f.actions
  end

  controller do

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

    def access_list
      if params['orig'] == ''
        orig_groups = nil
      else
        orig_groups = params['orig'].split(",").map { |s| s.to_i }.sort
      end
      if params['new'] == ''
        sel_groups = nil
      else
        sel_groups = params['new'].split(",").map { |s| s.to_i }.sort
      end
      @user_table = view_context.usergroup_table(orig_groups, sel_groups)
      respond_to do |format|
        format.html { render :json => @user_table.to_json }
        format.json { render :json => @user_table.to_json }
      end
    end

  end

end
