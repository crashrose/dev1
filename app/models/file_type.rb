class FileType < ActiveRecord::Base

	has_many :uploads, inverse_of: :file_type

	scope :playbook, -> {where(:name => 'playbook').first}
	scope :resource, -> {where(:name => 'resource').first}
	scope :import, -> {where(:name => 'import').first}
	scope :instructional, -> {where(:name => 'instructional').first}
	scope :multimedia, -> {where(:name => 'multimedia').first}
end
