class GoogleSharedCalendarsController < ApplicationController
# Copyright (C) 2012 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# require 'rubygems'
require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/file_storage'
# require 'sinatra'
# require 'logger'

before_action :has_user, only: [:index]
# before_action :main_authorize, only: [:has_user]
after_action :serialize_token #, only: [:index]

# enable :sessions

CREDENTIAL_STORE_FILE = "#{$0}-oauth2.json"

# # def logger; settings.logger end

# attr_accessor :api_client

# attr_accessor :calendar

# attr_accessor :sessions

# attr_accessor :user_credentials
attr_accessor :api_client
attr_accessor :calendar

def user_credentials
  # Build a per-request oauth credential based on token stored in session
  # which allows us to use a shared API client.
  if !@api_client
    self.api_client
  end
  @user_credentials ||= (
    auth = @api_client.authorization.dup
    auth.redirect_uri = url_for(:oauth2callback)#'/oauth2callback'
    auth.update_token!({
  "access_token" => session['access_token'],
  "refresh_token" => session['refresh_token'],
  "expires_in" => session['expires_in'],
  "issued_at" => session['issued_at']

      })
  #     file_storage = Google::APIClient::FileStorage.new(CREDENTIAL_STORE_FILE)
  # file_storage.write_credentials(auth)
    auth
  )

end

def api_client

  client = Google::APIClient.new(
    :application_name => 'Ruby Calendar sample',
    :application_version => '1.0.0')

# #   client_credentials = {
# #   :access_token => Rails.application.secrets.access_token,
# #   :authorization_uri => Rails.application.secrets.authorization_uri,
# #   :client_id => Rails.application.secrets.client_id,
# #   :client_secret => Rails.application.secrets.client_secret,
# #   :expires_in => Rails.application.secrets.expires_in,
# #   :refresh_token => Rails.application.secrets.refresh_token,
# #   :token_credential_uri => Rails.application.secrets.token_credential_uri,
# #   :issued_at => Rails.application.secrets.issued_at  
# #   }
  
# # client_secrets = Google::APIClient::ClientSecrets.new(client_credentials)
# # client.authorization = client_secrets.to_authorization

  file_storage = Google::APIClient::FileStorage.new(CREDENTIAL_STORE_FILE)
#   # @result = JSON.load(file)file_storage.path

#   # File.open(CREDENTIAL_STORE_FILE, 'r') do |file|
#   #           cached_credentials = JSON.load(file)
#   #           @authorization = Signet::OAuth2::Client.new(cached_credentials)
#   #           # @result = {'result1' => @authorization}
#   #           # @authorization.issued_at = Time.at(cached_credentials['issued_at'])

#   #           if @authorization.expired?
#   #             @authorization.fetch_access_token!
#   #             # self.write_credentials
#   #           end
#   #           # @result['result2'] = @authorization
#   #           @result = cached_credentials
#   #         end
          

  if file_storage.authorization.nil?
    client_secrets = Google::APIClient::ClientSecrets.load
    client.authorization = client_secrets.to_authorization
    client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
  else
    client.authorization = file_storage.authorization
  end
# oauth2authorize(client)
#   # # Since we're saving the API definition to the settings, we're only retrieving
#   # # it once (on server start) and saving it between requests.
#   # # If this is still an issue, you could serialize the object and load it on
#   # # subsequent runs.
  calendar = client.discovered_api('calendar', 'v3')


  @api_client = client
  @calendar = calendar

#   # self.calendar = calendar
#   # # user_credentials
#   # serialize_token
end

# before do 
  def has_user
    # Ensure user has authorized the app
    if !@user_credentials
      self.user_credentials
    end
    if !@user_credentials.access_token && !(request.path_info =~ /\A\/oauth2/)
      # redirect to('/oauth2authorize')
      oauth2authorize
    # else
      # main_authorize
    end
  end


# after do
  def serialize_token
  # Serialize the access/refresh token to the session and credential store.
  session[:access_token] = user_credentials.access_token
  session[:refresh_token] = user_credentials.refresh_token
  session[:expires_in] = user_credentials.expires_in
  session[:issued_at] = user_credentials.issued_at
  # session[:api_client] = @api_client


end

def oauth2authorize
# get '/oauth2authorize' do
  # Request authorization
  # client.authorization.redirect_uri = url_for(:oauth2callback)
  # @result = client.authorization.authorization_uri
  redirect_to(@api_client.authorization.authorization_uri.to_s)
end

def oauth2callback
# get '/oauth2callback' do
  # Exchange token
  @user_credentials.code = params[:code] if params[:code]
  @user_credentials.fetch_access_token!
  # redirect to('/')
  redirect_to root_url
end

def index
  # main_authorize
  # has_user
  # Fetch list of events on the user's default calandar
  if !@api_client
    self.api_client
  end
  @result = @api_client.execute(:api_method => @calendar.events.list,
                              :parameters => {'calendarId' => 'primary'},
                              :authorization => user_credentials)
  # [result.status, {'Content-Type' => 'application/json'}, result.data.to_json]
end
# 
# 
# 
# 
end