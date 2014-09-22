class PlaybooksController < ApplicationController
  before_action :set_playbook, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  helper_method :sort_direction, :sort_column

  # GET /playbooks
  # GET /playbooks.json
  def index

    @playbooks = Upload.playbooks
    # @playbooks = @event_users.playbooks
    respond_with @playbooks
  end

  # GET /playbooks/1
  # GET /playbooks/1.json
  def show
    @playbooks = Upload.playbooks.find(params[:id])
    respond_with @playbook
  end

  # GET /playbooks/new
  def new
    @playbook = Upload.new
    @playbook.file_type = FileType.find_by_name('playbook')
    respond_with [@playbook]
  end

  def after_initialize
    @playbook.event_id = event_user.event_id
    @playbook.user_id = event_user.user_id
  end

  # GET /playbooks/1/edit
  def edit
    @playbook = Upload.playbooks.find(params[:id])
    respond_with [@playbook]
  end


  # POST /playbooks
  # POST /playbooks.json
  def create
    @playbook = Upload.new(playbook_params)
    @playbook.file_type = FileType.find_by_name('playbook')
    new_was_successful = @playbook.save

    respond_with [@playbook] do |format|
      format.html{
        if new_was_successful
            redirect_to(admin_playbooks_path, :notice => 'The Playbook was added')
        else
          render 'new', :notice => 'Some input was not valid.'
        end
      }
    end
  end

  def multi_update
    @playbooks = []
    playbook_batch_params.values.each do |playbook|
    @event_user = EventUser.find_or_initialize_by(id: playbook[:event_user_id])
    # @event_user.playbooks.new(playbook)
    @playbook = @event_user.playbooks.active.find_or_initialize_by(event_user: @event_user)
      if @playbook.id
        @old_playbook = @playbook
        @playbook = Playbook.new(playbook)
        @playbook.attributes = playbook
        if @playbook.playbook_status_id != @old_playbook.playbook_status_id || @playbook.playbook_reason_id != @old_playbook.playbook_reason_id || @playbook.details != @old_playbook.details
          @playbook.id = :nil
          @old_playbook.active = :false
          @old_playbook.save
          @playbook.save
        end
      else
        @playbook.attributes = playbook
        if @playbook.playbook_status_id != nil
          @playbook.save
        end
      end
    end
  end


  def batch_update
    # multi_update
          if multi_update
            redirect_to(playbooks_path, :notice => 'The Playbook was created')
          else
            redirect_to(playbooks_path, :notice => 'Some input was not valid.')
          end

  end


  # # PATCH/PUT /playbooks/1
  # # PATCH/PUT /playbooks/1.json
  def update
    respond_to do |format|
      if @playbook.update(playbook_params)
        format.html { redirect_to admin_playbooks_path, notice: 'Playbook was successfully updated.' }
        format.json { render :show, status: :ok, playbook: @playbook }
      else
        format.html { render :edit }
        format.json { render json: @playbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # # DELETE /playbooks/1
  # # DELETE /playbooks/1.json
  # def destroy
  #   @playbook.destroy
  #   respond_to do |format|
  #     format.html { redirect_to playbooks_url, notice: "#{@playbook.name} was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_playbook
    @playbook = Playbook.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def playbook_params
    params.require(:upload).permit(:name, :file_type_id, :document, :description, group_ids: [], upload_groups_attributes: [ :upload_id, :group_id ])
  end

  def playbook_batch_params
    params.require(:playbooks).permit!
  end

  def sort_column
      %w[event_starts_at event_type event_location].include?(params[:sort]) ? params.require(:sort) : "event_starts_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:dir]) ? params.require(:dir) : "asc"
  end

  def batch_update_params(event_user)
    single_params = ActionController::Parameters.new(
      single_playbook: {
      event_id: event_user[:event_id],
      user_id: event_user[:user_id],
      event_user: event_user[:event_user],
      playbook_status_id: event_user[:playbook_status_id],
      playbook_reason_id: event_user[:playbook_reason_id],
      details: event_user[:details]
      })
    permitted = params.require(:single_playbook).permit(:event_user, :user_id, :event_id, :playbook_reason_id, :playbook_status_id, :details, :tag_list)
    return permitted
  end
end
