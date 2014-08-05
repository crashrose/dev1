ActiveAdmin.register Form, menu_name: :configure  do

navigation_menu :configure


  filter :name
  filter :form_fields
  filter :publish_results
  filter :email_results
  filter :email_to_address
  filter :created_at
  filter :updated_at


  member_action :view_submissions, :method => :get   do
    @form = Form.find(params[:id])
    # @submissions = FormSubmission.find_by form_id: params[:id]
    # # user.lock!
    # redirect_to {:action => :show},
  end

  action_item only: :show do
    link_to('View Submissions', view_submissions_admin_form_path(params[:id]))
  end

  action_item only: :index do
    link_to('View Submissions', view_submissions_admin_form_path(:id))
  end

index do
  sortable_handle_column
  column :name
  column :publish_results
  column :email_results
  column :email_to_address
    actions do |form|
      link_to "Submissions", view_submissions_admin_form_path(form)#, :class => "member_link"
    end
end



 form do |f|
    f.inputs 'Details'
    f.inputs 'Fields' do
      f.has_many :form_fields, sortable: :position, allow_destroy: true, new_record: true do |a|
        a.input :name
        a.input :field_type
      end
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
