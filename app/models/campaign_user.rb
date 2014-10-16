class CampaignUser < ActiveRecord::Base

	belongs_to :team_role
	belongs_to :user
	belongs_to :campaign
	has_many :campaign_user_positions
	has_many :positions, :through => :campaign_user_positions
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
