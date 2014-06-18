class FormSubmissionsController < ApplicationController

  respond_to :html

  # GET /form_submissions/new
  def new
    @form_submission = form.form_submissions.new
    @form_submission.form.form_fields.each do |field|
      form_submission_item = @form_submission.form_submission_items.build(form_field_id: field.id)
    end
    
    respond_with [form, @form_submission]
  end

  def edit
    @form_submission = form.form_submissions.find(params[:id])
    respond_with [form, @form_submission]
  end


  def update
    @form_submission = form.form_submissions.find(params[:id])
    update_was_successful = @form_submission.update_attributes(form_submission_params)

    respond_with [form, @form_submission] do |format|
      format.html{
        if update_was_successful
            redirect_to(form_path(form), :notice => 'The response was successfully updated.')
        else
          render 'edit', :notice => 'The response could not be updated.'
        end
      }
    end
  end


  def create
    @form_submission = form.form_submissions.new(form_submission_params)
    new_was_successful = @form_submission.save

    respond_with [form, @form_submission] do |format|
      format.html{
        if new_was_successful
            redirect_to(form_path(form), :notice => 'The response was successfully submitted.')
        else
          render 'new', :notice => 'The response could not be submitted.'
        end
      }
    end

    # respond_with @params
  end

  def destroy
    form_submission = form.form_submissions.find(params[:id])
    if form_submission.destroy
      flash[:notice] = 'The form_submission was destroyed'
    else
      flash[:alert] = 'The form_submission could not be destroyed'
    end

    respond_with [form, @form_submission] do |format|
      format.html{
        redirect_to(form_path(form), :notice => 'The form_submission was deleted.')
      }
    end

  end

  private

  def form
  	@form ||= Form.find(params[:form_id])
  end

  def form_submission_params
    params.require(:form_submission).permit(:form_id, :user_id, :form_submission_items, :form_submission_items_attributes => [:form_submission_item_id, :form_submission_id, :form_field_id, :form_field_value ])
    # params.require(:person)
    # params.require(:form_submission_item).permit(:id, :form_submission_id, :form_field_id, :form_field_value)
  end

end
