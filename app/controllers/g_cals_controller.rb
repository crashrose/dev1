class GCalsController < ApplicationController


  require 'google/api_client'
  require 'google/api_client/client_secrets'
  require 'google/api_client/auth/file_storage'
  require 'json'


  require 'apis/google_api'
  require 'apis/g_cal_api'

  include Apis::GoogleApi


  before_action :user_credentials, only: [:index, :gmod ]
  respond_to :html, :xml, :json
  # after_action :serialize_token , only: [:index]


# , :oauth2callback
CREDENTIAL_STORE_FILE = "#{$0}-oauth2.json"

  def index
    # g_cal_id = self.g_cal_id
    # GCalEvent.get_g_cal_id(session[:organization_id])

@gg_cal_list = @g_cal_api.build_g_cal_select_list
# n_g_cal = 
    # event_list = @g_cal_api.get_g_cal_events
    # @data = JSON.pretty_generate(calendar_list.data.items)
    # @timezone = ActiveSupport::TimeZone.zones_map()
    # @timezones2 = TZInfo::Timezone.us_zone_identifiers
    
    # @g_cals = JSON.parse(@data)
    # @results = event_list.data.items
    # @results = GCalEvent.build_events(event_list.data.items, g_cal_id, session[:organization_id])
    # @results = @user_credentials
    respond_to do |format|
      format.html #{ render :json => @results }# index.html.erb
      format.json { render :json => @results }
    end
  end

  def edit
    @g_cal_event = GCalEvent.new(g_cal_param)
  end

  def new
    cur_g_cal = self.g_cal
    @sel_g_cal = GCal.new(g_cal_param)

    if cur_g_cal.g_cal_id != @sel_g_cal.g_cal_id
      cur_g_cal.active = false
      @sel_g_cal.organization_id = session[:organization_id]
      @new_was_successful = cur_g_cal.save && @sel_g_cal.save
    else
      @sel_g_cal = cur_g_cal
    end


    respond_with  do |format|
      format.html{
        if @new_was_successful == true
            redirect_to(g_cals_path, :notice => 'The Calendar was selected')
        else

          redirect_to(g_cals_path, :notice => "#{@new_was_successful}")
        end
      }
    end
  end

  def user_credentials
    @g_cal_api = create_api
    serialize_token
 
  end


  #Set authorization codes and go to index
  def oauth2callback
    @g_cal_api.oauth2callback
  end

  def error_handling(e)
    session[:refresh_attempt_count] += 1
    if session[:refresh_attempt_count] <3
      self.refresh_token(session[:refresh_token])
    end
  end


  def g_cal_hash_param
    params.require(:g_cal).permit!
  end

  def g_cal_param
    params.require(:g_cal).permit!
  end


















#   require 'google/api_client'
#   require 'google/api_client/client_secrets'
#   require 'google/api_client/auth/file_storage'
#   require 'json'


#   before_action :user_credentials, only: [:index]
#   after_action :serialize_token , only: [:index]
# # , :oauth2callback
# CREDENTIAL_STORE_FILE = "#{$0}-oauth2.json"

#   def user_credentials
#     # Build a per-request oauth credential based on token stored in session
#     # which allows us to use a shared API client.
#     # self.auth
#     # api_client = Rails.application.config.google_api_client
#     @user_credentials = Rails.application.config.google_api_client.authorization.dup
#     @api_client = Rails.application.config.google_api_client
#     if !session[:access_token]
#       redirect_to(@user_credentials.authorization_uri({:access_type => "offline", :approval_prompt => "force"}).to_s)
#     else
#       @user_credentials.access_token = session[:access_token] 
#       @user_credentials.refresh_token = session[:refresh_token] 
#       @user_credentials.code = session[:code] 
#       # @user_credentials.expires_in = session[:expires_in] 
#       # @user_credentials.issued_at = session[:issued_at] 
#       @user_credentials.update_token!
#     end

#     # @user_credentials ||= (
#     #   auth = !session['google_credentials'] ? @api_client.authorization.dup : session['google_credentials']
#     #   if auth.access_token.blank?
#     #     redirect_to(@api_client.authorization.authorization_uri.to_s)
#     #   else
#     #   # auth.code = session[:code]
#     #   # TODO: set redirect_uri via code
#     #   auth.redirect_uri = ("http://localhost:3000/signet/google/auth_callback")
#     #   # url_for(:oauth2callback)#'/oauth2callback'
#     #   auth.update_token!
#     #   # ({
#     #   # "access_token" => session['access_token'],
#     #   # "refresh_token" => session['refresh_token'],
#     #   # "expires_in" => session['expires_in'],
#     #   # "issued_at" => session['issued_at']
#     #   #   })
#     #   # auth.fetch_access_token! if auth.expired?
#     #   auth
#     # end
#     # )
#   end

#   # def auth
#   #   client = Google::APIClient.new(
#   #       :application_name => 'Ruby Calendar sample',
#   #       :application_version => '1.0.0')
#   #   if File.exist?(CREDENTIAL_STORE_FILE) 
#   #     file_storage = Google::APIClient::FileStorage.new(CREDENTIAL_STORE_FILE)
#   #     if !file_storage.authorization.nil?
#   #       client.authorization = file_storage.authorization
#   #     else
#   #       client_secrets = Google::APIClient::ClientSecrets.load
#   #       client.authorization = client_secrets.to_authorization
#   #       client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
#   #     end 
#   #   else
#   #     client_secrets = Google::APIClient::ClientSecrets.load
#   #     client.authorization = client_secrets.to_authorization
#   #     client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
#   #   end
#   #   @api_client = client
#   # end

#   # Ensure user has authorized the app
# #   def has_user
# #     #initialize user credentials and route to oauth method if no token
# #     if !session['google_credentials']
# #         @api_client = Rails.application.config.google_api_client
   
# #     # if !@user_credentials.access_token && !(request.path_info =~ /\A\/oauth2/)
# #       redirect_to(@api_client.authorization.authorization_uri.to_s)
# #       # self.oauth2authorize
# #     end
# # else
# #      self.user_credentials
# #    end
# #   end


# def self.credentials_expired?( credentials )
#   client = Google::APIClient.new
#   client.authorization = @user_credentials
#   oauth2 = client.discovered_api('calendar', 'v3')
#   result = client.execute!(:api_method => oauth2.userinfo.get)

#   (result.status != 200)
# end


#   # Perform serialization after index call
#   def serialize_token
#     # Serialize the access/refresh token to the session and credential store.
#     session[:access_token] = @user_credentials.access_token
#     session[:refresh_token] = @user_credentials.refresh_token
#     session[:code] = @user_credentials.code
#     # session[:refresh_attempt_count] = 0
#     # session[:expires_in] = @user_credentials.expires_in
#     # session[:issued_at] = @user_credentials.issued_at
#     # session[:google_credentials] = @user_credentials


# # TODO: Set method to write credentials back to .json file
#     # file_storage = Google::APIClient::FileStorage.new(Rails.application.config.google_api_client_cred_file)
#     # file_storage.write_credentials(@user_credentials)
#   end


#   # Request authorization
#   # def oauth2authorize
#     # redirect_to(@api_client.authorization.authorization_uri.to_s)
#   # end


#   #Set authorization codes and go to index
#   def oauth2callback
#     # Exchange token
#     # if !@user_credentials
#       new_auth = Rails.application.config.google_api_client.authorization.dup
#     # end
#     new_auth.code = params[:code] if params[:code]
#     # new_auth.grant_type = 'authorization_code'
#     new_auth.fetch_access_token!
#     # session[:google_credentials] = new_auth
#     @user_credentials = new_auth
#     self.serialize_token
#     session[:refresh_attempt_count] = 0

# redirect_to(g_cals_path)
#     # @user_credentials = new_auth
#   end

# def error_handling(e)
# session[:refresh_attempt_count] += 1
# if session[:refresh_attempt_count] <3
# self.refresh_token(session[:refresh_token])
# end

# end

# def refresh_token
#   new_auth = @user_credentials
# new_auth.grant_type = 'refresh_token'
#   new_auth.refresh_token = refresh_token

#   new_auth.fetch_access_token!
# @user_credentials = new_auth
#       self.serialize_token
# redirect_to(g_cals_path)
# end

#   def index
#     org_id = session[:organization_id]
#     g_cal = GCal.find_by(:organization_id => org_id)
#     # Fetch list of events on the user's default calandar
#     calendar = @api_client.discovered_api('calendar', 'v3')
#     request = @api_client.generate_request(:api_method => calendar_list.list,
#                                           :parameters => {'calendarId' => g_cal.g_cal_id}
#                                           )
#     event_list = @api_client.execute(request, :authorization => @user_credentials )
#       @data = JSON.pretty_generate(event_list.data.items)
#       @events = JSON.parse(@data)
#       @results = self.build_events(event_list.data.items)


          
#       respond_to do |format|
#         format.html # index.html.erb
#         format.json { render :json => @results }

#       end

#   end

#   def select
#     org_id = 2
#     g_cal = GCal.find_or_initialize_by(:g_cal_id => params[:g_cal_id], :organization_id => org_id)
#     if !g_cal.id 
#       g_cal.save
#     end
#     redirect_to(g_cals_path)
#   end

#     def build_events(items)
#   @events = []
#   items.each do |item|
#     # event = item.class.name

#   # all_day = !!item['start']['date'] ? true : false

#   # startdate = all_day ? item['start']['date'] : item['start']['dateTime']
#   # enddate = all_day ? item['end']['date'] : item['end']['dateTime']

#   event = GCalEvent.google_build(item)

# #   event = GCalEvent.new({
# #   :accessRole           => item['accessRole'],
# #   :allDay               => all_day,
# #   :backgroundColor      => item['backgroundColor'],
# #   :colorId              => item['colorId'],
# #   :created              => item['created'],
# #   :creator              => item['creator'],
# #   :defaultReminders     => item['defaultReminders'],
# #   :description          => item['description'],
# #   :end                  => enddate,
# #   :etag                 => item['etag'],
# #   :foregroundColor      => item['foregroundColor'],
# #   :iCalUID              => item['iCalUID'],
# #   :id                   => item['id'],
# #   :htmlLink             => item['htmlLink'],
# #   :kind                 => item['kind'],
# #   :location             => item['location'],
# #   :notificationSettings => item['notificationSettings'],
# #   :organizer            => item['organizer'],
# #   :primary              => item['primary'],
# #   :reminders            => item['reminders'],
# #   :selected             => item['selected'],
# #   :sequence             => item['sequence'],
# #   :start                => startdate,
# #   :status               => item['status'],
# #   :summary              => item['summary'],
# #   :title                => item['summary'],
# #   :timeZone             => item['timeZone'],
# #   :transparency         => item['transparency'],
# #   :updated              => item['updated']
# # }
# #     )
#     @events << event
#   end
#   return @events


# end

#   def setAll_day(item)
#     all_day = !!item['start']['date'] ? :true : :false
#   end


end