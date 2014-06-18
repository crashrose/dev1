class FileType < ActiveRecord::Base

	has_many :uploads

	scope :playbook, -> {where(:name => 'playbook').first}
end
