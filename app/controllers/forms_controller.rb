class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all
    respond_with @forms
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
    @forms = Form.find(params[:id])
    respond_with @form
  end

  # GET /forms/new
  def new
    @form = Form.new

    respond_with @form
  end

  # GET /forms/1/edit
  def edit
    respond_with @form
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(form_params)
    new_was_successful = @form.save

    respond_with [@form] do |format|
      format.html{
        if new_was_successful
            redirect_to(forms_path, :notice => 'The Form was created')
        else
          render 'new', :notice => 'Some input was not valid.'
        end
      }
    end
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: form_params }
        format.json { render :show, status: :ok, form: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: "#{@form.name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:form).permit(:name, :publish_results, :email_results, :email_to_address)
    end
end
