ActiveAdmin.register Upload, as: "Playbook"  do

navigation_menu :configure

    controller do

      def scoped_collection
        Upload.playbooks.includes :mime_type
      end
      helper :views
      # def resource
      #   Playbooks.index
      # end
      def autocomplete_tags
        @tags = ActsAsTaggableOn::Tag.
        where("name LIKE ?", "#{params[:q]}%").
        order(:name)
        respond_to do |format|
          format.json { render :json => @tags.collect{|t| {:id => t.name, :name => t.name }}}
        end
      end

      def show_params
        respond_to do |format|
          format.html { render json: params }
        end
      end
    end

permit_params :name, :file_type_id, :document, :description, :tag_list, group_ids: [], upload_groups_attributes: [ :upload_id, :group_id ]

  filter :name
  filter :groups
  filter :document_file_name
  filter :document_file_size
  filter :description
  filter :tags


index do
  selectable_column
  column :name
  column 'File', :document_file_name
  column 'File Size', sortable: :document_file_size do |playbook|
    number_to_human_size(playbook.document_file_size, precision: 2)
  end
  column 'File Type', :mime_type, sortable: "mime_types.title" 
  # do |playbook|
  #   playbook.mime_type.file_type
  # end
  column 'Available To' do |playbook|
    playbook.groups.map { |group| userlist_popover(group)}.to_sentence.html_safe
  end
  # column :email_to_address
  #   actions do |form|
  #     link_to "Submissions", view_submissions_admin_form_path(form)#, :class => "member_link"
  #   end
  column :tag_list, sortable: false
  actions
end

# index as: :grid do |playbook|
#   # link_to image_tag(Icon.for_filename(playbook.document_file_name)), edit_admin_playbook_path(playbook)
#   link_to(image_tag(Icon.for_filename(playbook.document_file_name), :title => playbook.name), edit_admin_playbook_path(playbook))
# end
# index as: :grid, columns: 4 do |playbook|
#   # div for: playbook do
#   div :class => 'panel panel-default panel-playbook' do 
#     div :class => 'panel-heading playbook-heading' do
#       resource_selection_cell playbook
#       h3 link_to(playbook.name, edit_admin_playbook_path(playbook)), :class => 'panel-title'
#     # resource_selection_cell playbook
#     # text_node image_tag(Icon.for_filename(playbook.document_file_name)).html_safe
#     end
#     div :class => 'panel-body' do
#       div simple_format 'Description: '+playbook.description
#       div simple_format 'File: '+playbook.document_file_name
#       div simple_format 'Available to: '+playbook.groups.map { |group| group.name }.to_sentence
#     end
#   end
# end

form partial: 'form'
  # form do |f|

  #   f.inputs "Details" do
  #     f.input :name
  #     f.input :description
  #     f.input :tag_list
  #   end

  #   f.inputs 'File' do
  #     ## add line for filename if this is a resource edit
  #     f.file_field :document
  #   end

  #   f.inputs 'Access' do
  #     f.select :group_ids, Group.all.collect {|x| [x.name, x.id]}, {}, :multiple => true
  #   end
  #   f.actions
  # end





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

