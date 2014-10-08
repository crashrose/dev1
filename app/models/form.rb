class Form < ActiveRecord::Base

	has_many :form_fields, :dependent => :destroy, :autosave => :true
	has_many :form_submissions, :dependent => :destroy, :autosave => :true
	has_many :form_submission_items, :through => :form_submissions
	accepts_nested_attributes_for :form_submission_items, :form_fields, :form_submissions

  belongs_to :organization
  acts_as_tenant(:organization)

	scope :fields, -> {Form.includes(:form_fields)}
end
