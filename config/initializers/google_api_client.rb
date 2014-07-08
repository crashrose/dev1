CREDENTIAL_STORE_FILE = "#{$0}-oauth2.json"
require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/file_storage'


client = Google::APIClient.new(
    :application_name => 'Ruby Calendar sample',
    :application_version => '1.0.0')
# if File.exist?(CREDENTIAL_STORE_FILE) 
# 	file_storage = Google::APIClient::FileStorage.new(CREDENTIAL_STORE_FILE)
# 	if !file_storage.authorization.nil?
# 		client.authorization = file_storage.authorization
# 	else
# 		client_secrets = Google::APIClient::ClientSecrets.load
# 		client.authorization = client_secrets.to_authorization
# 		client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
# 	end	
# else
	client_secrets = Google::APIClient::ClientSecrets.load
	client.authorization = client_secrets.to_authorization
	client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
	# options = {
	# 	:access_type => "offline",
	# 	:approval_prompt => "force",
	# 	:redirect_uri => "http://localhost:3000/signet/google/auth_callback"
	# }
	# client.authorization.authorization_uri = 
# end


Rails.application.config.google_api_client = client
Rails.application.config.google_api_client_cred_file = CREDENTIAL_STORE_FILE