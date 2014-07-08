module Apis
  module GoogleApi

  	attr_accessor :api_client
  	attr_accessor :user_credentials
  	attr_accessor :calendar_api
  	attr_accessor :g_cal

    require 'apis/g_cal_api'


    def create_api
      options = {:access_token => session[:access_token].to_s,
                        :refresh_token => session[:refresh_token].to_s,
                        :code => session[:code].to_s,
                        :organization_id => session[:organization_id].to_s, 
                        :g_cal => self.g_cal}

      @g_cal_api = GCalApi::new(options)
      serialize_token
      @g_cal_api
    end

    def g_cal
      @g_cal = GCal.active_by_org(session[:organization_id]).first
    end


    def oauth2callback
      # Exchange token
      new_auth = Rails.application.config.google_api_client.authorization.dup
      new_auth.code = params[:code] if params[:code]
      new_auth.fetch_access_token!
      @user_credentials = new_auth
      self.serialize_token
      session[:refresh_attempt_count] = 0
      redirect_to(g_cal_events_path)
    end


      # Perform serialization
    def serialize_token
      # Serialize the access/refresh token to the session and credential store.
      session[:access_token] = @g_cal_api.user_credentials.access_token
      session[:refresh_token] = @g_cal_api.user_credentials.refresh_token
      session[:code] = @g_cal_api.user_credentials.code

    # # TODO: Set method to write credentials back to .json file
    #     # file_storage = Google::APIClient::FileStorage.new(Rails.application.config.google_api_client_cred_file)
    #     # file_storage.write_credentials(@user_credentials)
    end

  end
end