ActiveAdmin.register User  do

navigation_menu :configure

batch_action :destroy, false

  permit_params  group_ids: [], group_users_attributes: [ :user_id, :group_id ]

  controller do
    def scoped_collection
      User.joins(:organization_users, :person).where(:organization_users =>{:organization_id => ActsAsTenant.current_tenant.id})
      # Organization.find(ActsAsTenant.current_tenant.id).users
    end

    def update
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end

    helper :views
  end

  index do
    selectable_column
    column :first_name
    column 'Last Name', sortable: 'person.last_name' do |user|
      user.person.last_name
    end
    column :email
    column 'Member of' do |user|
      user.groups.map { |group| group.name}.to_sentence.html_safe
    end
    column :sign_in_count
    actions defaults: false do |user|
      link_to('<span class="glyphicon glyphicon-pencil"></span>'.html_safe, edit_admin_user_path(user.id)).html_safe  + ' ' +
      link_to('<span class="glyphicon glyphicon-remove"></span>'.html_safe, remove_from_team_admin_user_path(user.id), :method => :delete).html_safe
    end
    # actions do |user|
    #   # link_to '<span class="glyphicon glyphicon-remove"></span>'.html_safe, remove_from_team_admin_user_path(user.id), :method => :delete
    #   link_to '<span class="glyphicon glyphicon-pencil"></span>'.html_safe, admin_user_path(user.id)
    # end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :groups

form partial: 'form'

  # batch_action :add_to_groups do |selection|
  #   Response.approval_change "Reject", selection
  #   redirect_to collection_path, :notice => "Responses rejected."
  # end

# title is in config/locales/en.yml
batch_action :add_u_to_group,  form: ->{{group: Group.pluck(:name, :id)}} do |ids, inputs|
  ids = ids.map(&:to_i)
  users_to_add = ids - GroupsUser.where(:user_id => ids, :group_id => inputs[:group]).pluck(:user_id)
  group_user_hash = users_to_add.map {|user_id| {:user_id => user_id, :group_id => inputs[:group]}}.flatten
  GroupsUser.create([group_user_hash])
  redirect_to collection_url, :notice => "Users were successfully added to group."
end


batch_action :remove_u_from_group,  form: ->{{group: Group.pluck(:name, :id)}} do |ids, inputs|
  ids = ids.map(&:to_i)
  removed = GroupsUser.delete_all(:user_id => ids, :group_id => inputs[:group])
  # group_user_hash = users_to_remove.map {|user_id| {:user_id => user_id, :group_id => inputs[:group]}}.flatten
  # GroupsUser.create([group_user_hash])
  redirect_to collection_url, :notice => "Users were successfully removed from group."
end


batch_action :remove_u_from_team do |selection|
  ids = selection.map(&:to_i)
  exempt_self = ids.delete(current_user.id)
  if !ids.empty?
    OrganizationUser.delete_all(:user_id => ids, :organization_id => ActsAsTenant.current_tenant.id)
    notice = exempt_self ? 'You cannot remove yourself from the team. All other selected users have been removed.' :
     'Selected users were successfully removed from team.'
  else
    notice = exempt_self ? 'You cannot remove yourself from the team. There were no other users selected so no changes have been made.' :
     'No valid users were selected.'
  end
  # removed = OrganizationUser.delete_all(:user_id => ids, :organization_id => ActsAsTenant.current_tenant.id)
  # group_user_hash = users_to_remove.map {|user_id| {:user_id => user_id, :group_id => inputs[:group]}}.flatten
  # GroupsUser.create([group_user_hash])
  # notice = exempt_self ? 'You cannot remove yourself from the team. All other selected users have been removed.' : 'Selected users were successfully removed from team.'
  redirect_to collection_url, :notice => notice  # "#{exempt_self.inspect} -- #{ids.inspect}" #{removed}<BR>Users were successfully removed from team."
end

# batch_action :add_to_groups, form: {
#   # type: %w[Offensive Spam Other],
#   group: :text,
#   # notes:  :textarea,
#   # hide:   :checkbox,
#   # date:   :datepicker
# } do |ids, inputs|
#   # inputs is a hash of all the form fields you requested
#   redirect_to collection_path, notice: [ids, inputs].to_s
# end

#Single Member Actions
  member_action :remove_from_team, method: :delete do 
    OrganizationUser.delete_all(:user_id => params[:id], :organization_id => ActsAsTenant.current_tenant.id)
    redirect_to collection_url, :notice => "User removed from team."
  end

  action_item only: :edit do
    delete_link("Remove User From Team", remove_from_team_admin_user_path(:id))
  end
end
