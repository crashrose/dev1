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
has_many :upload_groups, :through => :groups
has_many :ul_groups
has_many :uploads, :through => :upload_groups
has_many :event_users, inverse_of: :user
has_one :person
# has_many :o_auth2_credentials, dependent: :destroy

scope :all_people,->  {where.not(person_id: nil)}
# scope :upload_users,-> {where}

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

  # def ul_group_list(upload_id)
  #   ul_groups(upload_id).map {|group| group.name}.join(",")
  # end

  def ul_groups(upload_id)
    # self.name + ' == ' + self.groups.groups_for_upload(upload_id)
    self.groups.ul_groups(upload_id).map {|group| group.name}.to_sentence
  end


end

