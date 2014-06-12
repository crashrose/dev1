class EventTypesController < ApplicationController
  before_action :set_event_type, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  # GET /event_types
  # GET /event_types.json
  def index
    @event_types = EventType.all
    respond_with @event_types
  end

  # GET /event_types/1
  # GET /event_types/1.json
  def show
    @event_types = EventType.find(params[:id])
    respond_with @event_type
  end

  # GET /event_types/new
  def new
    @event_type = EventType.new

    respond_with @event_type
  end

  # GET /event_types/1/edit
  def edit
    respond_with @event_type
  end

  # POST /event_types
  # POST /event_types.json
  def create
    @event_type = EventType.new(event_type_params)
    new_was_successful = @event_type.save

    respond_with [@event_type] do |format|
      format.html{
        if new_was_successful
            redirect_to(event_types_path, :notice => 'The Event Type was created')
        else
          render 'new', :notice => 'Some input was not valid.'
        end
      }
    end
  end

  # PATCH/PUT /event_types/1
  # PATCH/PUT /event_types/1.json
  def update
    respond_to do |format|
      if @event_type.update(event_type_params)
        format.html { redirect_to @event_type, notice: 'Event Type was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_type }
      else
        format.html { render :edit }
        format.json { render json: @event_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_types/1
  # DELETE /event_types/1.json
  def destroy
    @event_type.destroy
    respond_to do |format|
      format.html { redirect_to event_types_url, notice: "#{@event_type.title} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_type
      @event_type = EventType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_type_params
      params.require(:event_type).permit(:title)
    end
end
