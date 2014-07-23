class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy] #, :make_payment]
  respond_to :html, :xml, :json


  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show

    respond_to do |format|
      format.html
      format.json { render :json => @payment }
    end
  end

  def make_payment
@payment = Payment.find(params[:payment_id])
    respond_to do |format|
      format.html
      format.json { render :json => @payment }
    end
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    respond_to do |format|
      format.html
      format.json { render :json => @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    respond_with @payment
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    new_was_successful = @payment.save

    respond_with [@payment] do |format|
      format.html{
        if new_was_successful
            redirect_to(payments_path, :notice => 'The Payment was created')
        else
          render 'new', :notice => 'Some input was not valid.'
        end
      }
    end

  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, :notice => 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: "#{@payment.name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
        @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit!
    end


end
