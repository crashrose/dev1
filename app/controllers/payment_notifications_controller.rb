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
        respond_to do |format|
          format.html { render :json => params.to_json}
          format.json { render :json => params.to_json}
        end

        # PaymentNotification.create!(:params => notify_params,
        #   :status => notify_params[:payment_status],
        #   :transaction_id => notify_params[:txn_id],
        #   :user_id => notify_params[:custom][:user_id],
        #   :payment_id => notify_params[:custom][:payment_id]
        # )

    # render params.to_json
  end

  def ipn_params
      params.require(:custom).permit(:user_id, :org_id, :payment_id)
      params.require(:txn_id, :payment_status)
  end

  def payment_notification_params
      params.require(:payment_notification).permit(:custom) #shouldn't currently work
  end
end