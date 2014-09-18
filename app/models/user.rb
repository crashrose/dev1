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
has_many :event_users, inverse_of: :user
has_one :person
# has_many :o_auth2_credentials, dependent: :destroy

scope :all_people,->  {where.not(person_id: nil)}

	def name
    if !!person
			"#{person.first_name} #{person.last_name}"
    else
      nil
    end
	end

  def first_name
      person.first_name
  end

end

