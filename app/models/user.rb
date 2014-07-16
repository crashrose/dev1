class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,#:confirmable, 
         :lockable, :timeoutable#, :omniauthable


has_and_belongs_to_many :groups
has_many :event_groups, :through => :groups
has_many :event_users
has_one :person
# has_many :o_auth2_credentials, dependent: :destroy


	def name
    if !!self.person
			"#{self.person.first_name} #{self.person.last_name}"
    else
      ""
    end
	end

  def first_name
      self.person.first_name
  end

end

