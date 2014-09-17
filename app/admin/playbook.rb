ActiveAdmin.register Upload, as: "Playbook"  do

navigation_menu :configure

    controller do
      def scoped_collection
        Upload.playbooks
      end
      # def resource
      #   Playbooks.index
      # end
    end

permit_params :name, :file_type_id, :document, :description, group_ids: [], upload_groups_attributes: [ :upload_id, :group_id ]

  filter :name
  filter :groups
  filter :document_file_name
  filter :document_file_size
  filter :description

# index as: :grid do |playbook|
#   # link_to image_tag(Icon.for_filename(playbook.document_file_name)), edit_admin_playbook_path(playbook)
#   link_to(image_tag(Icon.for_filename(playbook.document_file_name), :title => playbook.name), edit_admin_playbook_path(playbook))
# end
index as: :block, columns: 3 do |playbook|
  div for: playbook do
    # resource_selection_cell playbook
    text_node image_tag(Icon.for_filename(playbook.document_file_name)).html_safe
    h3 link_to(playbook.name, edit_admin_playbook_path(playbook))
    div simple_format 'Description: '+playbook.description
    div simple_format 'File Name: '+playbook.document_file_name
    div simple_format 'Available to: '+playbook.groups.map { |group| group.name }.to_sentence
  end
end


  form do |f|

    f.inputs "Details" do
      f.input :name
      f.input :description
    end

    f.inputs 'File' do
      ## add line for filename if this is a resource edit
      f.file_field :document
    end

    f.inputs 'Access' do
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

