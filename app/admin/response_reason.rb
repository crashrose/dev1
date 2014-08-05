ActiveAdmin.register ResponseReason  do

  menu false

  config.sort_order = 'position_asc'

  permit_params :title, :position

  sortable

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
      @response_reason = ResponseReason.new(permitted_params[:response_reason])
      new_was_successful = @response_reason.save

      respond_with [@response_reason] do |format|
        format.html{
          if new_was_successful
              redirect_to(admin_schedule_path, :notice => 'The Response Reason was created')
          else
            render 'new', :notice => 'Some input was not valid.'
          end
        }
      end
    end
  end

end
