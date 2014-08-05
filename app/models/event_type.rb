class EventType < ActiveRecord::Base

	has_many :events, :dependent => :destroy

	validates :title,		:presence =>true
	# validates :position,	:presence =>true

	acts_as_list

	before_create :default_values

	private
	def default_values
		self.position = EventType.all.maximum(:position) +1
	end
end
