class ResponseReason < ActiveRecord::Base

  belongs_to :organization
  acts_as_tenant(:organization)


	acts_as_list

	private
	def default_values
		self.position = EventType.all.maximum(:position) +1
	end
	
end
