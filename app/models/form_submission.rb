class FormSubmission < ActiveRecord::Base

	belongs_to :form
	has_many :form_fields, :through => :form
	has_many :form_submission_items, autosave: :true, :dependent => :destroy
	accepts_nested_attributes_for :form_submission_items, :form_fields
  belongs_to :organization
  acts_as_tenant(:organization)

	scope :fields, -> {FormSubmission.includes(:form_fields)}
	
end
