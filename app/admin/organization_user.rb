ActiveAdmin.register OrganizationUser  do

navigation_menu :configure

  controller do
    def scoped_collection
      OrganizationUser.all.includes :user, :groups
    end
    # helper :views
  end

  permit_params  group_ids: [], group_users_attributes: [ :user_id, :group_id ]


  index do
    selectable_column
    column :user
    column 'Email', sortable: 'users.email' do |org_user|
      org_user.user.email
    end
    column 'Signed In At', sortable: 'users.current_sign_in_at' do |org_user|
      org_user.user.current_sign_in_at
    end
    column 'Sign In Count', sortable: 'users.sign_in_count' do |org_user|
      org_user.user.sign_in_count
    end
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :user
    end
    f.actions
  end

end
