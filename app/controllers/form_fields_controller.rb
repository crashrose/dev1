class FormFieldsController < ApplicationController

  respond_to :html

  # GET /form_fields/new
  def new
    @form_field = form.form_fields.new
    respond_with [form, @form_field]
  end

  def edit
    @form_field = form.form_fields.find(params[:id])
    respond_with [form, @form_field]
  end


  def update
    @form_field = form.form_fields.find(params[:id])
    update_was_successful = @form_field.update_attributes(form_field_params)

    respond_with [form, @form_field] do |format|
      format.html{
        if update_was_successful
            redirect_to(form_path(form), :notice => 'The Field was updated')
        else
          render 'edit', :notice => 'That update is not valid.'
        end
      }
    end
  end


  def create
    @form_field = form.form_fields.new(form_field_params)
    new_was_successful = @form_field.save

    respond_with [form, @form_field] do |format|
      format.html{
        if new_was_successful
            redirect_to(form_path(form), :notice => 'The form_field was created')
        else
          render 'new', :notice => 'Some input was not valid.'
        end
      }
    end
  end

  def destroy
    form_field = form.form_fields.find(params[:id])
    if form_field.destroy
      flash[:notice] = 'The form_field was destroyed'
    else
      flash[:alert] = 'The form_field could not be destroyed'
    end

    respond_with [form, @form_field] do |format|
      format.html{
        redirect_to(form_path(form), :notice => 'The form_field was deleted.')
      }
    end

  end

  private

  def form
  	@form ||= Form.find(params[:form_id])
  end

  def form_field_params
    params.require(:form_field).permit(:name, :form_id, :max_length, :min_length, :required, :field_type)
    # params.require(:person)
    # params.require(:form_field)
  end

end
