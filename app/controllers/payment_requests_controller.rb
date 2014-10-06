class PaymentRequestsController < ApplicationController
  before_action :set_payment_request, only: [:show, :edit, :update, :destroy] #, :make_payment_request]
  respond_to :html, :xml, :json


  # GET /payment_requests
  # GET /payment_requests.json
  def index
    @payment_requests = PaymentRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @payment_requests }
    end
  end

  # GET /payment_requests/1
  # GET /payment_requests/1.json
  def show

    respond_to do |format|
      format.html
      format.json { render :json => @payment_request }
    end
  end

  def make_payment
@payment_request = PaymentRequest.find(params[:payment_request_id])
    respond_to do |format|
      format.html
      format.json { render :json => @payment_request }
    end
  end

  # GET /payment_requests/new
  def new
    @payment_request = PaymentRequest.new
    respond_to do |format|
      format.html
      format.json { render :json => @payment_request }
    end
  end

  # GET /payment_requests/1/edit
  def edit
    respond_with @payment_request
  end

  # POST /payment_requests
  # POST /payment_requests.json
  def create
    @payment_request = Payment_request.new(payment_request_params)
    new_was_successful = @payment_request.save

    respond_with [@payment_request] do |format|
      format.html{
        if new_was_successful
            redirect_to(admin_payment_requests_path, :notice => 'The Payment_request was created')
        else
          render 'new', :notice => 'Some input was not valid.'
        end
      }
    end

  end

  # PATCH/PUT /payment_requests/1
  # PATCH/PUT /payment_requests/1.json
  def update
    respond_to do |format|
      if @payment_request.update(payment_request_params)
        redirect_to(admin_payment_requests_path, :notice => 'Payment_request was successfully updated.' )
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @payment_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_requests/1
  # DELETE /payment_requests/1.json
  def destroy
    @payment_request.destroy
    respond_to do |format|
      format.html { redirect_to payment_requests_url, notice: "#{@payment_request.name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_request
        @payment_request = Payment_request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_request_params
      params.require(:payment_request).permit!
    end


end
