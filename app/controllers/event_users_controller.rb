class EventUsersController < ApplicationController
  before_action :set_event_user, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  # GET /users
  # GET /users.json
  def index
    @event_users = EventUser.all_events
    respond_with @event_users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @event_user = EventUser.find(params[:event_user])
    respond_with @event_user
  end

  # # GET /users/new
  # def new
  #   @user = User.new

  #   respond_with @user
  # end

  # # GET /users/1/edit
  # def edit
  #   respond_with @user
  # end

  # # POST /users
  # # POST /users.json
  # def create
  #   @user = User.new(user_params)
  #   new_was_successful = @user.save

  #   respond_with [@user] do |format|
  #     format.html{
  #       if new_was_successful
  #           redirect_to(users_path, :notice => 'The User was created')
  #       else
  #         render 'new', :notice => 'Some input was not valid.'
  #       end
  #     }
  #   end
  # end

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, user: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /users/1
  # # DELETE /users/1.json
  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: "#{@user.name} was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_user_event
  #     @event_user = EventUser.find(params[:event_user])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def user_params
  #     params.require(:user).permit(:name, :address1, :address2, :city, :state, :zip, :country, :phone, :note, :website, :maplink)
  #   end
end