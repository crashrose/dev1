class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  # GET /responses
  # GET /responses.json
  def index
    @event_users = EventUser.all_events
    # @responses = @event_users.responses
    respond_with @event_users
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    @responses = Response.find(params[:id])
    respond_with @response
  end

  # GET /responses/new
  def new
    @response = event_user.responses.new
    @response.event_id = event_user.event_id
    @response.user_id = event_user.user_id

    respond_with [event_user, @response]
  end

  def after_initialize
    @response.event_id = event_user.event_id
    @response.user_id = event_user.user_id
  end

  # GET /responses/1/edit
  def edit
    @response = event_user.responses.active.find(params[:event_user])
    respond_with [event_user, @response]
  end


  # POST /responses
  # POST /responses.json
  def create
    @response = event_user.responses.new(response_params)
    new_was_successful = @response.save

    respond_with [event_user, @response] do |format|
      format.html{
        if new_was_successful
            redirect_to(event_users_path, :notice => 'The Response was created')
        else
          render 'new', :notice => 'Some input was not valid.'
        end
      }
    end
  end

  def multi_update
    @responses = []
    response_batch_params.values.each do |response|
    @event_user = EventUser.find_or_initialize_by(id: response[:event_user_id])
    # @event_user.responses.new(response) 
    @response = @event_user.responses.active.find_or_initialize_by(event_user: @event_user)
    
      if @response.id 
        @old_response = @response
        @response = Response.new(response)
        @response.attributes = response
        if @response.response_status_id != @old_response.response_status_id || @response.response_reason_id != @old_response.response_reason_id || @response.details != @old_response.details
          @response.id = :nil
          @old_response.active = :false
          @old_response.save
          @response.save
        end
      else
        @response.attributes = response
        if @response.response_status_id != nil
          @response.save
        end
      end
    end
  end


def batch_update
  # multi_update
        if multi_update
            redirect_to(responses_path, :notice => 'The Response was created')
        else
          redirect_to(responses_path, :notice => 'Some input was not valid.')
        end

end


  # # PATCH/PUT /responses/1
  # # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, response: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # # DELETE /responses/1
  # # DELETE /responses/1.json
  # def destroy
  #   @response.destroy
  #   respond_to do |format|
  #     format.html { redirect_to responses_url, notice: "#{@response.name} was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:responses).permit(:event_user,  { :event_user => [:event_user, :responses, :user_id, :event_id, :response_reason_id, :response_status_id, :detail] })
    end

    def response_batch_params
      params.require(:responses).permit!
    end

    def batch_update_params(event_user)
      single_params = ActionController::Parameters.new(
        single_response: {
        event_id: event_user[:event_id],
        user_id: event_user[:user_id],
        event_user: event_user[:event_user],
        response_status_id: event_user[:response_status_id],
        response_reason_id: event_user[:response_reason_id],
        details: event_user[:details]
        })
      permitted = params.require(:single_response).permit(:event_user, :user_id, :event_id, :response_reason_id, :response_status_id, :details)
      return permitted
    end      
end
