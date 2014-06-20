class GSharedCalendarsController < ApplicationController


CREDENTIAL_STORE_FILE = "#{$0}-oauth2.json"

  helper_method :current_user, :logged_in?


  def index
    if logged_in?
      credentials_storage = ::Google::APIClient::FileStorage.new(CREDENTIAL_STORE_FILE)
      @client = ::Google::APIClient.new(
        application_name:    'TeamRockett',
        application_version: '0.0.1'
      )
      @client.authorization = credentials_storage.authorization 
      service = @client.discovered_api('calendar', 'v3')
      @result = @client.execute(
      :api_method => service.calendar_list.list,
      :parameters => {},
      :headers => {'Content-Type' => 'application/json'}
      )
      
    end
  end

  def current_user
    u = nil
    if !!session[:user_id]
      begin
        u = User.find(session[:user_id])
      rescue ActiveRecord::RecordNotFound => e
        session[:user_id] = nil
      end
    end
    u
  end

  def logged_in?
    !!current_user
  end



# 
# 
# 
# 
# 

end
