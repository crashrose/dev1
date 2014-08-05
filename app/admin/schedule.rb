ActiveAdmin.register_page "Schedule" do

menu_options = {
  # :label => proc{ I18n.t("active_admin.dashboard")},
  # :priority =>  1
  id: 'sched'
}
menu menu_options

navigation_menu :configure

  content title: "Schedule Configuration" do

    columns do
      column max_width: "300px", min_width: "100px" do
        panel "Event Types" do
          table_for EventType.all.order(:position) do 
            sortable_handle_column
            column(nil,:title) 
            column {|event_type| link_to '<span class="glyphicon glyphicon-trash"></span>'.html_safe, admin_event_type_path(event_type), :method => :delete, :source => 'dashboard'}
          end
          text_node link_to " + Add New", new_admin_event_type_path
        end
      end
      column max_width: "300px", min_width: "100px" do
        panel "Response Reasons" do
          table_for ResponseReason.all.order(:position) do
            sortable_handle_column
            column(nil,:title)
            column {|response_reason| link_to '<span class="glyphicon glyphicon-trash"></span>'.html_safe, admin_response_reason_path(response_reason), :method => :delete, :source => 'dashboard'}
          end
          text_node link_to " + Add New", new_admin_response_reason_path
        end
      end
    end

  end # content
end
