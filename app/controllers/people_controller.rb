class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
    respond_with @people
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @people = Person.find(params[:id])
    respond_with @person
  end

  # GET /people/new
  def new
    @person = Person.new

    respond_with @person
  end

  # GET /people/1/edit
  def edit
    respond_with @person
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    new_was_successful = @person.save

    respond_with [@person] do |format|
      format.html{
        if new_was_successful
            redirect_to(people_path, :notice => 'The Person was created')
        else
          render 'new', :notice => 'Some input was not valid.'
        end
      }
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, person: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: "#{@person.name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :address1, :address2, :city, :state, :zip, :country, :phone, :note, :website, :maplink)
    end
end
