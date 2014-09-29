ActiveAdmin.register PaymentRequest do

navigation_menu :configure

permit_params :name, :amount, :owner_id, :status, :position, :tag_list, :description, group_ids: [], payment_groups_attributes: [ :payment_request_id, :group_id ]

config.sort_order = 'position_asc'
# config.sortable = false
form partial: 'form'

sortable
  index do
    sortable_handle_column
    column 'Priority', :position
    column "Name" do |payment_request|
      link_to payment_request.name, edit_admin_payment_request_path(payment_request), title: payment_request.description
    end
    # link_to "Preview", admin_preview_post_path(post), class: "member_link"
    # column :name, sortable: false
    column :description, sortable: false
    column :amount, sortable: false
    column :owner, sortable: false
    column :status, sortable: false
    column :tag_list, sortable: false
    actions
  end


controller do
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

      # def scoped_collection
      #   Upload.playbooks.includes :mime_type
      # end
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

      def access_list
        if params['orig'] == ''
          orig_groups = nil
        else
          orig_groups = params['orig'].split(",").map { |s| s.to_i }.sort
          # @playbook = Upload.playbooks.find(params['p'])
          # orig_groups = @playbook.group_ids
        end

        if params['new'] == ''
          sel_groups = nil
        else
          sel_groups = params['new'].split(",").map { |s| s.to_i }.sort
        end

        respond_to do |format|
          format.html { render :json => usergroup_table(orig_groups, sel_groups).to_json }
          format.json { render :json => usergroup_table(orig_groups, sel_groups).to_json }
        end
      end


      def usergroups_to_s(groups)
        # User.select(:id).joins(:groups).includes(:groups, :person).merge(Group.select(:name).where(id: groups)).explain
        User.joins(:groups, :person).where(groups: {id: groups})
        .group('users.id', "people.first_name || ' ' || people.last_name")
        .order("people.first_name || ' ' || people.last_name")
        .pluck("people.first_name || ' ' || people.last_name as full_name", "string_agg(groups.name,', ') as group_list")
        
        # User.operation_over_aggregate_column(:id, )
      end

      def usergroup_table(orig_groups, new_groups=nil)
        if !orig_groups && !new_groups
          nil
        elsif !orig_groups
          new_list = usergroups_to_s(new_groups).map {|item| {:status => 'Added', :full_name => item[0], :group_list => item[1]}}
        elsif !new_groups || orig_groups == new_groups
          new_list = usergroups_to_s(orig_groups).map {|item| {:status => 'Saved', :full_name => item[0], :group_list => item[1]}}
        else
          orig_users = usergroups_to_s(orig_groups).map {|user| user[0]}
          new_list = Hash[*usergroups_to_s(new_groups).flatten]
          new_users = new_list.keys.flatten
          removed_users = orig_users - new_users
          added_users = new_users - orig_users
          unchanged_users = new_users & orig_users
          removed_list = removed_users.map {|item| {:status => 'Removed', :full_name => item, :group_list => ''}}
          added_list = added_users.map {|item| {:status => 'Added', :full_name => item, :group_list => new_list[item]}}
          unchanged_list = unchanged_users.map {|item| {:status => 'Unchanged', :full_name => item, :group_list => new_list[item]}}
          @combined_list = removed_list + added_list + unchanged_list
          # gebbb
        end
      end

    end


  # form do |f|

  #   f.inputs "Details" do
  #     f.input :name
  #     f.input :description
  #     f.input :amount
  #     f.input :owner
  #   end


  #   f.inputs 'Responsible Groups' do
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
