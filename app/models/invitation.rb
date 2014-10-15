class Invitation < ActiveRecord::Base

	belongs_to :organization_user
	belongs_to :organization
	belongs_to :sender, :class_name => 'User'
	belongs_to :recipient, :class_name => 'User'

	  acts_as_tenant(:organization)

	before_create :generate_token
	before_save :check_user_existence

	def generate_token
		self.token = Digest::SHA1.hexdigest([self.organization_id, Time.now, rand].join)
	end




	def check_user_existence
		recipient = User.find_by_email(email)
		if recipient
			self.recipient_id = recipient.id
		end
	end



end
