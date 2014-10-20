class Campaign < ActiveRecord::Base

	has_many :roster_members, :foreign_key => :campaign_id, class_name: "CampaignUser", inverse_of: :campaign
	has_many :users, :through => :roster_members
	has_many :people, :through => :roster_members, foreign_key: "user_id", primary_key: "user_id"
	has_many :roster_players, -> {where(:team_role_id => TeamRole.find_by_title("Players").id)}, :foreign_key => :campaign_id, class_name: "CampaignUser"
	has_many :players, :through => :roster_players, :source => :user
	has_many :roster_admins, -> {where(:team_role_id => TeamRole.find_by_title("Administrative Staff").id)}, :foreign_key => :campaign_id, class_name: "CampaignUser"
	has_many :admins, :through => :roster_admins, :source => :user
	has_many :roster_coaches, -> {where(:team_role_id => TeamRole.find_by_title("Coaching Staff").id)}, :foreign_key => :campaign_id, class_name: "CampaignUser"
	has_many :coaches, :through => :roster_coaches, :source => :user
	has_many :roster_others, -> {where(:team_role_id => TeamRole.find_by_title("Other Team Members").id)}, :foreign_key => :campaign_id, class_name: "CampaignUser"
	has_many :others, :through => :roster_others, :source => :user
	belongs_to :organization

	acts_as_tenant(:organization)

	scope :current, -> { where("? BETWEEN start_date AND end_date", Time.now.to_date)}
	scope :latest, -> { where("? > end_date", Time.now.to_date).order(end_date: :desc).limit(1)}
	scope :upcoming, -> { where("? < start_date", Time.now.to_date).order(start_date: :asc).limit(1)}



	# def players

	# end

	def non_players
		User.org_users.where.not(:id => players)
	end

	def non_admins
		User.org_users.where.not(:id => admins)
	end

	def non_coaches
		User.org_users.where.not(:id => coaches)
	end

	def non_others
		User.org_users.where.not(:id => others)
	end

end
