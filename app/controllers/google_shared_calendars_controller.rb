class GoogleSharedCalendarsController < ApplicationController

  require 'google/api_client'
  require 'google/api_client/client_secrets'
  require 'google/api_client/auth/file_storage'

  before_action :has_user, only: [:index]
  after_action :serialize_token , only: [:index]


  def user_credentials
    # Build a per-request oauth credential based on token stored in session
    # which allows us to use a shared API client.
    @api_client = Rails.application.config.google_api_client
    @user_credentials ||= (
      auth = @api_client.authorization.dup
      auth.redirect_uri = url_for(:oauth2callback)#'/oauth2callback'
      auth.update_token!({
      "access_token" => session['access_token'],
      "refresh_token" => session['refresh_token'],
      "expires_in" => session['expires_in'],
      "issued_at" => session['issued_at']
        })
      auth
    )
  end


  # Ensure user has authorized the app
  def has_user
    #initialize user credentials and route to oauth method if no token
    self.user_credentials
    if !@user_credentials.access_token && !(request.path_info =~ /\A\/oauth2/)
      oauth2authorize
    end
  end


  # Perform serialization after index call
  def serialize_token
    # Serialize the access/refresh token to the session and credential store.
    session[:access_token] = @user_credentials.access_token
    session[:refresh_token] = @user_credentials.refresh_token
    session[:expires_in] = @user_credentials.expires_in
    session[:issued_at] = @user_credentials.issued_at

# TODO: Set method to write credentials back to .json file
    # file_storage = Google::APIClient::FileStorage.new(Rails.application.config.google_api_client_cred_file)
    # file_storage.write_credentials(@user_credentials)
  end


  # Request authorization
  def oauth2authorize
    redirect_to(@api_client.authorization.authorization_uri.to_s)
  end


  #Set authorization codes and go to index
  def oauth2callback
    # Exchange token
    if !@user_credentials
      self.user_credentials
    end
    @user_credentials.code = params[:code] if params[:code]
    @user_credentials.fetch_access_token!
    redirect_to root_url
  end


  def index
    # Fetch list of events on the user's default calandar
    calendar = @api_client.discovered_api('calendar', 'v3')
    # @result = @api_client.authorization
    @result = @api_client.execute(:api_method => calendar.events.list,
                                :parameters => {'calendarId' => 'primary'},
                                :authorization => @user_credentials)
  end

end