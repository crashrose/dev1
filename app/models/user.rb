class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable,
  #        :recoverable, :rememberable, :trackable, :validatable

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,#:confirmable,
         :lockable, :timeoutable, :registerable#, :omniauthable


has_many :groups_users
has_many :groups, :through => :groups_users, inverse_of: :users
has_many :event_groups, :through => :groups
has_many :upload_groups, :through => :groups
has_many :ul_groups
has_many :uploads, :through => :upload_groups
has_many :event_users, inverse_of: :user
has_one :person
  has_many :organization_users
  has_many :organizations, :through => :organization_users
has_many :invitations, :class_name => "Invitation", :foreign_key => 'recipient_id'
    has_many :sent_invites, :class_name => "Invitation", :foreign_key => 'sender_id'

scope :all_people,->  {where.not(person_id: nil)}
scope :org_users,->  {joins(:organization_users, :person).where(:organization_users => {:organization_id => ActsAsTenant.current_tenant.id})}
# scope :in_groups,->
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

  # def non_groups(upload_id)
  #   # self.name + ' == ' + self.groups.groups_for_upload(upload_id)
  #   self.groups.ul_groups(upload_id).map {|group| group.name}.to_sentence
  # end

  def non_groups
    Group.where.not(:id => groups)
  end

  # def for_groups([])
  #   User.joins.
  # end

end

