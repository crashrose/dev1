class GCalEventsController < ApplicationController

  require 'google/api_client'
  require 'google/api_client/client_secrets'
  require 'google/api_client/auth/file_storage'
  require 'json'
  require 'apis/google_api'
  require 'apis/g_cal_api'

  include Apis::GoogleApi

helper_method :redirect_to

  before_action :user_credentials, only: [:index, :gmod ]

  CREDENTIAL_STORE_FILE = "#{$0}-oauth2.json"



  def index
    event_list = @g_cal_api.get_g_cal_events
    # @data = JSON.pretty_generate(event_list.data)
    # @events = JSON.parse(@data)
    # @results = event_list.data.items
    @results = GCalEvent.build_events(event_list.data, g_cal.g_cal_id, session[:organization_id])
    respond_to do |format|
      format.html
      format.json { render :json => @results }
    end

# @results = @g_cal_api.user_credentials
  end

  def edit
    # g_cal_event_hash = params[:g_cal_event]
    @g_cal_event = GCalEvent.new(g_cal_event_hash_param)
    # @g_cal_event.url = g_cal_event_hash
    # respond_with @g_cal_event

  end

  def gmod

    @g_cal_event = g_cal_event_param
    update_was_successful = @g_cal_api.update_g_cal_event(@g_cal_event) == 200 ? true : false

    ## add code to redirect back to edit form if update wasn't successful

    respond_to do |format|
      if update_was_successful
        format.html { redirect_to(calendar_path, :notice => 'The Event was updated.')}
        format.json { head :no_content }
      else
        format.html { render :action => "gmod" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end

  end

  def user_credentials
    @g_cal_api = create_api
    serialize_token
  end


  #Set authorization codes and go to index
  # def oauth2callback
  #   GCalApi::oauth2callback
  # end

  def error_handling(e)
    session[:refresh_attempt_count] += 1
    if session[:refresh_attempt_count] <3
      self.refresh_token(session[:refresh_token])
    end
  end

  def g_cal_event_hash_param
    params.require(:g_cal_event).permit!
  end

  def g_cal_event_param
    params.require(:g_cal_event).permit!
  end


end