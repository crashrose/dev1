class CampaignUser < ActiveRecord::Base

	belongs_to :team_role_type
	belongs_to :user, inverse_of: :campaign_users
  
  belongs_to :person, foreign_key: "user_id", primary_key: "user_id"
	belongs_to :campaign, inverse_of: :roster_members
	has_many :campaign_user_positions, inverse_of: :campaign_user
	has_many :positions, :through => :campaign_user_positions, inverse_of: :campaign_users
  # belongs_to :child_pos_user, :class_name => "User"
  # has_many :child_positions, :through => :campaign_user_positions 

	belongs_to :organization

  acts_as_tenant(:organization)

  scope :players, -> {joins(:team_role_type).where(:team_role_types => {:title => 'Player'})}
  scope :coaches,->  {joins(:team_role_type).where(:team_role_types => {:title => 'Coaching Staff'})}
  scope :administrative_staff,->  {joins(:team_role_type).where(:team_role_types => {:title => 'Administrative'})}
  scope :operational_staff,-> {joins(:team_role_type).where(:team_role_types => {:title => 'Operational'})}
  scope :support_staff,-> {joins(:team_role_type).where(:team_role_types => {:title => 'Support'})}
  scope :leadership,-> {joins(:team_role_type).where(:team_role_types => {:title => 'Leadership'})}
  scope :current_campaign, -> {where(:campaign => Campaign.current)}

  # def current_campaign
  # 	CampaignUser.where(:campaign => Campaign.current)
  # end

end
