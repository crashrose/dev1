ActiveAdmin.register Group, menu_name: :configure  do

navigation_menu :configure

permit_params :name, :description, user_ids: [], group_users_attributes: [ :user_id, :group_id ]

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end


  index do
    column :name, sortable: false
    column :description, sortable: false
    column "Members" do |group|
      group.users.count
    end


    # column :owner, sortable: false
    # column :status, sortable: false
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


end
