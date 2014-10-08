class FormField < ActiveRecord::Base

	belongs_to :form
	has_many :form_submission_items, :dependent => :destroy
	accepts_nested_attributes_for :form_submission_items
	
  belongs_to :organization
  acts_as_tenant(:organization)
end
