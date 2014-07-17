class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, 
  #        :recoverable, :rememberable, :trackable, :validatable

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable,#:confirmable, 
         :lockable, :timeoutable, :registerable#, :omniauthable


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

