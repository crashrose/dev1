ActiveAdmin.register Invitation  do

navigation_menu :configure

  controller do
    def scoped_collection
      Invitation.all
    end
    # helper :views
  end

  permit_params :email, :password, :password_confirmation


  index do
    selectable_column
    column :name
    column :email_address
    column :status
    column :created_at
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  # form do |f|
  #   f.inputs "Admin Details" do
  #     f.input :email
  #     f.input :password
  #     f.input :password_confirmation
  #   end
  #   f.actions
  # end

end
