class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  def create

  	# notify_params = payment_notification_params
  	# # notify_hash = {:params => notify_params,
  	# #  			:status => notify_params[:payment_status],
  	# #  			:transaction_id => notify_params[:txn_id],
  	# #  			:user_id => notify_params[:custom][:user_id],
  	# #  			:payment_id => notify_params[:custom][:payment_id]
  	# #  		}

   #  PaymentNotification.create!(:params => notify_params,
  	#  			:status => notify_params[:payment_status],
  	#  			:transaction_id => notify_params[:txn_id],
  	#  			:user_id => notify_params[:custom][:user_id],
  	#  			:payment_id => notify_params[:custom][:payment_id]
			# 	)
   #  render :nothing => true
  end

  def process_ipn
    # notify_params = payment_notification_params
    # @request = request.raw_post

require "net/http"
require "uri"

  @ipn_params = ipn_params
        @ipn = PaymentNotification.new(:params => request.raw_post, :status => "Awaiting IPN Validation")
        @ipn.save
        incoming_uri = URI.parse(request.original_url)


outgoing_uri = URI.parse('https://www.sandbox.paypal.com/cgi-bin/webscr' + '?cmd=_notify-validate')

    http = Net::HTTP.new(outgoing_uri.host, outgoing_uri.port)
    http.open_timeout = 60
    http.read_timeout = 60
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.use_ssl = true
    response = http.post(outgoing_uri.request_uri, request.raw_post).body

    @ipn.status = response
    @ipn.transaction_id = @ipn_params.custom
    @ipn.save


        respond_to do |format|
          format.html { render :text => @ipn.inspect}
          format.json { render :json => @ipn.inspect}
        end
        # PaymentNotification.create!(:params => notify_params,
        #   :status => notify_params[:payment_status],
        #   :transaction_id => notify_params[:txn_id],
        #   :user_id => notify_params[:custom][:user_id],
        #   :payment_id => notify_params[:custom][:payment_id]
        # )

    # render params.to_json
  end

  # def index
  #   @payment_notifications = PaymentNotifications.all
  #   respond_with @payment_notifications
  # end

  def ipn_params
      params.require(:custom)
      params.require(:txn_id, :payment_status)
  end

  def payment_notification_params
      params.require(:payment_notification).permit(:custom) #shouldn't currently work
  end
end