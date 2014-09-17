class ResponseReason < ActiveRecord::Base

	acts_as_list

	private
	def default_values
		self.position = EventType.all.maximum(:position) +1
	end
	
end
