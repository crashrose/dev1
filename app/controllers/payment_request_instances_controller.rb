class PaymentRequestInstancesController < ApplicationController
  protect_from_forgery :except => [:create]
  def create

  end

  def index
    @payment_request_instances = PaymentRequestInstance.all
    respond_with @payment_request_instances
  end


end