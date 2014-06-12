  class EventGroupsController < ApplicationController
  before_action :set_event_group, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  # # GET /events
  # # GET /events.json
  # def index
  #   @events = Event.all
  #   respond_with @events
  # end

  # # GET /events/1
  # # GET /events/1.json
  # def show
  #   @event = Event.find(params[:id])
  #   respond_with @event
  # end

  # # GET /events/new
  # def new
  #   @event = Event.new

  #   respond_with @event
  # end

  # # GET /events/1/edit
  # def edit
  #   respond_with @event
  # end

  # POST /events
  # POST /events.json
  def create
    @event_group = EventGroup.new(event_group_params)
    new_was_successful = @event.save

    respond_with [@event] do |format|
      format.html{
        if new_was_successful
            redirect_to(events_path, :notice => 'The event was created')
        else
          render 'new', :notice => 'Some input was not valid.'
        end
      }
    end
  end

  # # PATCH/PUT /events/1
  # # PATCH/PUT /events/1.json
  # def update
  #   respond_to do |format|
  #     if @event.update(event_params)
  #       format.html { redirect_to @event, notice: 'Event was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @event }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @event.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event_group.destroy
    respond_to do |format|
      format.html {redirect_to event_path(@event_group.event), notice: "Group was successfully removed from event." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_group
      @event_group = EventGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_group_params
      params.require(:event_group).permit(:event_id, :group_id)
    end
end
