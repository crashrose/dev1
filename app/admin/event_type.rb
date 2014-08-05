ActiveAdmin.register EventType  do

menu false

# menu_options = {
#   :parent =>  :sched
# }
# menu menu_options

# navigation_menu :configure

# config.filters = false
config.sort_order = 'position_asc'
# config.paginate   = false

permit_params :title, :position

sortable
  # index do
  #   # selectable_column
  #   sortable_handle_column
  #   column :title, sortable: false
  #   # column :move_vertical
  #   actions
  # end

  controller do
    def destroy
      resource.destroy
      respond_to do |format|
      # if params[:source] == 'dashboard'
        format.html { redirect_to admin_schedule_path, notice: "#{resource.title} was successfully destroyed." }
      # else  
      #   format.html { redirect_to event_types_url, notice: "#{@event_type.title} was successfully destroyed." }
      # end
        format.json { head :no_content }
      end
    end

    def create
      @event_type = EventType.new(permitted_params[:event_type])
      new_was_successful = @event_type.save

      respond_with [@event_type] do |format|
        format.html{
          if new_was_successful
              redirect_to(admin_schedule_path, :notice => 'The Event Type was created')
          else
            render 'new', :notice => 'Some input was not valid.'
          end
        }
      end
    end
  end

#   index as: :grid, default: true do |event_type|
#   link_to admin_event_type_path(event_type)
# end

  # index do |event_type|
  #   div :for => event_type do
  #     h2 auto_link(event_type.title)
  #     div do
  #       simple_format event_type.title
  #     end
  #   end
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
