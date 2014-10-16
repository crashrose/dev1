ActiveAdmin.register PaymentRequest do

navigation_menu :organization

permit_params :name, :amount, :owner_id, :status, :position, :tag_list, :description, group_ids: [], payment_groups_attributes: [ :payment_request_id, :group_id ]

config.sort_order = 'position_asc'
form partial: 'form'

sortable
  index do
    sortable_handle_column
    column 'Priority', :position
    column "Name" do |payment_request|
      link_to payment_request.name, edit_admin_payment_request_path(payment_request), title: payment_request.description
    end
    column :description, sortable: false
    column :amount, sortable: false
    column :owner, sortable: false
    column :status, sortable: false
    column :tag_list, sortable: false
    actions
  end


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

    def autocomplete_tags
      @tags = ActsAsTaggableOn::Tag.
      where("name LIKE ?", "#{params[:q]}%").
      order(:name)
      respond_to do |format|
        format.json { render :json => @tags.collect{|t| {:id => t.name, :name => t.name }}}
      end
    end

  end

end
