class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  require 'apis/google_api'
  require 'apis/g_cal_api'

  include Apis::GoogleApi


  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show

    # if !@event.g_cal_event_id


    # @event = Event.find(params[:id])
    # respond_with @event
    respond_to do |format|
      format.html 
      format.json { render :json => @event }
    end
  end

  # GET /events/new
  def new
  
    if params[:g_cal_event] then
      @event = Event.new_from_g_cal_event(g_cal_event_params, session[:organization_id])

## TO DO - add functinality to save event changes back to google


    else
      @event = Event.new
    end
    respond_to do |format|
      format.html 
      format.json { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
    respond_with @event
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    new_was_successful = @event.save

    respond_with [@event] do |format|
      format.html{
        if new_was_successful
            redirect_to(events_path, :notice => 'The Event was created')
        else
          render 'new', :notice => 'Some input was not valid.'
        end
      }
    end

  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, :notice => 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "#{@event.name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      if params[:id].first(6) != 'g_cal_'
        @event = Event.find(params[:id])
      else
        @g_cal_api = create_api
        @g_cal_event = @g_cal_api.new_g_cal_event(params[:id].from(6))
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :starts_at, :ends_at, :event_type_id, :location_id, :owner_id, :all_day, :g_cal_event_id, :g_cal_id, :organization_id, :respond_by, :group_ids, group_ids: [], event_groups_attributes: [ :event_id, :group_id ])
    end

    def g_cal_event_params
      params.require(:g_cal_event).permit!
    end
end
