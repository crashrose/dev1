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

# form_builder ||= SimpleForm::FormBuilder

  form do |f|
    f.inputs "Details", :class => 'col-md-4', :type => 'panel' do
      f.input :name
      f.input :publish_results
      f.input :email_results
      f.input :email_to_address
    end
    f.inputs "Fields", :class => 'col-md-4', :type => 'panel' do 
      f.has_many :form_fields, sortable: :position, allow_destroy: true, new_record: true, :type => 'inner-panel' do |a|
        a.input :name
        a.input :field_type
      end
    end
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :publish_results, :email_results, :email_to_address,
     :form_field_ids, form_field_ids: [],
      form_fields_attributes: [:id, :name, :form_id, :max_length, :min_length, :required, :field_type, :position, :organization_id ]

  #
  # or
  #
  # permit_params do
  #  permitted = [:name, :form_id, :max_length, :min_length, :required, :field_type]
  #  permitted << :other if resource.something?
  #  permitted
  # end
end
