class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    respond_with @locations
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @locations = Location.find(params[:id])
    respond_with @location
  end

  # GET /locations/new
  def new
    @location = Location.new

    respond_with @location
  end

  # GET /locations/1/edit
  def edit
    respond_with @location
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)
    new_was_successful = @location.save

    respond_with [@location] do |format|
      format.html{
        if new_was_successful
            redirect_to(admin_locations_path, :notice => "The Location was created #{location_params}")
        else
          render 'new', :notice => 'Some input was not valid.'
        end
      }
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to admin_locations_path, notice: "Location was successfully updated. #{location_params}" }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to admin_locations_path, notice: "#{@location.name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :address, :address2, :city, :state, :zip, :country, :phone, :note, :website, :maplink, :latitude, :longitude)
    end
end
