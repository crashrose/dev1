# G_CREDENTIAL_STORE_FILE = "#{$0}-oauth2.json"
# require 'google/api_client'
# require 'google/api_client/client_secrets'
# require 'google/api_client/auth/file_storage'

# ### Google API Client Details
# g_client = Google::APIClient.new(
#     :application_name => 'TeamRockett Google Calendar Integration',
#     :application_version => '0.0.1')

# g_client_secrets = Google::APIClient::ClientSecrets.load
# g_client.authorization = g_client_secrets.to_authorization
# g_client.authorization.scope = 'https://www.googleapis.com/auth/calendar'

# Rails.application.config.google_api_client = g_client
# Rails.application.config.google_api_client_cred_file = G_CREDENTIAL_STORE_FILE


# ### PayPal API Client Details

# # require 'paypal-sdk-rest'
# # include PayPal::SDK::REST

# # ppl_api = PayPal::SDK::REST.set_config(
# #     :ssl_options => {}, # Set ssl options
# #     :mode => :sandbox,  # Set :sandbox or :live
# #     :client_id     => "ATEw8xD6ujzlu0Nf7lzB58CwtFtwh3ITaoKD3rzMUjd2iPo3mhfRBjEusLc6",
# #     :client_secret => "EEj7SRDgEu0M6Ld_-rUbSHdV8LryPEiQZfsv0hWZE0MGbL0WZCQvx38TjIIs" )
# # Rails.application.config.paypal_api_token = ppl_api.token
