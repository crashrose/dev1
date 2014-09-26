class PaymentTransactionsController < ApplicationController
  protect_from_forgery :except => [:create]
  def create

  end

  def process_ipn
    # notify_params = payment_transaction_params
    # @request = request.raw_post

require "net/http"
require "uri"

  @ipn_params = ipn_params
        @ipn = PaymentTransaction.new(:params => request.raw_post, :status => "Awaiting IPN Validation")
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
    custom_params = JSON.parse(params.require(:custom))
    @ipn.user_id = custom_params['user_id']
    @ipn.save


        respond_to do |format|
          format.html { render :text => @ipn.inspect}
          format.json { render :json => @ipn.inspect}
        end
        # PaymentTransaction.create!(:params => notify_params,
        #   :status => notify_params[:payment_status],
        #   :transaction_id => notify_params[:txn_id],
        #   :user_id => notify_params[:custom][:user_id],
        #   :payment_id => notify_params[:custom][:payment_id]
        # )

    # render params.to_json
  end

  # def index
  #   @payment_transactions = PaymentTransactions.all
  #   respond_with @payment_transactions
  # end

  def ipn_params
      # params.permit(:custom, :txn_id, :payment_status)
      # params.require(:txn_id)
      # params.require(:payment_status)
  end

  def payment_transaction_params
      params.require(:payment_transaction).permit(:custom) #shouldn't currently work
  end
end