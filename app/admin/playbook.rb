ActiveAdmin.register Upload, as: "Playbook"  do

  menu_options = {
    :label =>  'Playbooks',
    :priority => 19
  }
  menu menu_options
  navigation_menu :team

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

    def scoped_collection
      Upload.playbooks.includes :mime_type
    end

    def autocomplete_tags
      @tags = ActsAsTaggableOn::Tag.
      where("name LIKE ?", "#{params[:q]}%").
      order(:name)
      respond_to do |format|
        format.json { render :json => @tags.collect{|t| {:id => t.name, :name => t.name }}}
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
  column 'Available To' do |playbook|
    playbook.groups.map { |group| userlist_popover(group)}.to_sentence.html_safe
  end
  column :tag_list, sortable: false
  actions
end


form partial: 'form'

end

