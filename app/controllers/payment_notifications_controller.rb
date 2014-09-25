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
    notify_params = payment_notification_params

        PaymentNotification.create!(:params => notify_params,
          :status => notify_params[:payment_status],
          :transaction_id => notify_params[:txn_id],
          :user_id => notify_params[:custom][:user_id],
          :payment_id => notify_params[:custom][:payment_id]
        )
    render :nothing => true
  end

  def payment_notification_params
      params.require(:params).permit!
  end
end