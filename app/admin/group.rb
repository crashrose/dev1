ActiveAdmin.register Group, menu_name: :configure  do

  navigation_menu :organization

  permit_params :name, :description, user_ids: [], group_users_attributes: [ :user_id, :group_id ]

  index do
    column :name, sortable: false
    column :description, sortable: false
    column "Members" do |group|
      group.users.count
    end
    actions defaults: false do |item|
      link_to('<span class="glyphicon glyphicon-pencil"></span>'.html_safe, edit_admin_group_path(item.id)).html_safe  + ' ' +
      link_to('<span class="glyphicon glyphicon-remove"></span>'.html_safe, admin_group_path(item.id), :method => :delete).html_safe
    end
  end

form partial: 'form'

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
