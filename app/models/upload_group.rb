class UploadGroup < ActiveRecord::Base

	belongs_to :group
	belongs_to :upload
end
