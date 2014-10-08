class FormSubmissionItem < ActiveRecord::Base

	belongs_to :form_submission
	has_one :form, :through => :form_submission
	belongs_to :form_field
  belongs_to :organization
  acts_as_tenant(:organization)

	scope :fields, -> {FormSubmissionItem.includes(form_submission.fields)}
	
end
