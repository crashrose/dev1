ActiveAdmin.register Payment do

navigation_menu :configure

permit_params :name, :amount, :owner_id, :status, :position, :description, group_ids: [], payment_groups_attributes: [ :payment_id, :group_id ]

config.sort_order = 'position_asc'
# config.sortable = false

# menu_options = {
#   :label => 'Payments',
# }
# menu menu_options

sortable
  index do
    sortable_handle_column
    column 'Priority', :position
    column "Name" do |payment|
      link_to payment.name, edit_admin_payment_path(payment), title: payment.description
    end
    # link_to "Preview", admin_preview_post_path(post), class: "member_link"
    # column :name, sortable: false
    column :description, sortable: false
    column :amount, sortable: false
    column :owner, sortable: false
    column :status, sortable: false
    actions
  end


  form do |f|

    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :amount
      f.input :owner
    end


    f.inputs 'Responsible Groups' do
      f.select :group_ids, Group.all.collect {|x| [x.name, x.id]}, {}, :multiple => true
    end
    f.actions
  end


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
end
