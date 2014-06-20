# CREDENTIAL_STORE_FILE = "#{$0}-oauth2.json"
# require 'google/api_client'
# require 'google/api_client/client_secrets'
# require 'google/api_client/auth/file_storage'


# client = Google::APIClient.new(
#     :application_name => 'Ruby Calendar sample',
#     :application_version => '1.0.0')
# file_storage = Google::APIClient::FileStorage.new(CREDENTIAL_STORE_FILE)

# if file_storage.authorization.nil?
# 	client_secrets = Google::APIClient::ClientSecrets.load
# 	client.authorization = client_secrets.to_authorization
# 	client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
# else
# 	client.authorization = file_storage.authorization
# end


# Rails.application.config.google_api_client = client
# Rails.application.config.google_api_calendar = client.discovered_api('calendar', 'v3')