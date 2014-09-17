class Location < ActiveRecord::Base

	has_many :events

	validates :name,		:presence =>true

	# attr_accessible :address, :latitude, :longitude
	# geocoded_by :address
	# after_validation :geocode, :if => :address_changed?


	def self.address
		@address
	end

	def self.latitude
		@latitude
	end

	def self.longitude
		@longitude
	end


end
