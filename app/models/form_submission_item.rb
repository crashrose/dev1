class FormSubmissionItem < ActiveRecord::Base

	belongs_to :form_submission
	has_one :form, :through => :form_submission
	belongs_to :form_field

	scope :fields, -> {FormSubmissionItem.includes(form_submission.fields)} 
	
end
