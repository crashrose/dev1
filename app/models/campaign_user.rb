class CampaignUser < ActiveRecord::Base

	belongs_to :team_role
	belongs_to :user, inverse_of: :campaign_users
  
  belongs_to :person, foreign_key: "user_id", primary_key: "user_id"
	belongs_to :campaign, inverse_of: :roster_members
	has_many :campaign_user_positions, inverse_of: :campaign_user
	has_many :positions, :through => :campaign_user_positions, inverse_of: :campaign_users
  # belongs_to :child_pos_user, :class_name => "User"
  # has_many :child_positions, :through => :campaign_user_positions 

	belongs_to :organization

  acts_as_tenant(:organization)

  scope :players, -> {joins(:team_role).where(:team_roles => {:title => 'Players'})}
  scope :coaching_staff,->  {joins(:team_role).where(:team_roles => {:title => 'Coaching Staff'})}
  scope :administrative_staff,->  {joins(:team_role).where(:team_roles => {:title => 'Administrative Staff'})}
  scope :other_team_members,->  {joins(:team_role).where(:team_roles => {:title => 'Other Team Members'})}
  scope :current_campaign, -> {where(:campaign => Campaign.current)}

  # def current_campaign
  # 	CampaignUser.where(:campaign => Campaign.current)
  # end

end
