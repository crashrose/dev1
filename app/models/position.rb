class Position < ActiveRecord::Base

	belongs_to :sport
	belongs_to :team_role#, class_name: "TeamRole", foreign_key: "role_id"
	belongs_to :parent, class_name: "Position", foreign_key: "parent_id"


	scope :players,-> {joins(:team_role).where(:team_roles => {:title => 'Players'})}
	scope :admins,-> {joins(:team_role).where(:team_roles => {:title => 'Administrative Staff'})}
	scope :coaches,-> {joins(:team_role).where(:team_roles => {:title => 'Coaching Staff'})}
	scope :others,-> {joins(:team_role).where(:team_roles => {:title => 'Others'})}

	def self.scope_by(scope=nil)
		scope = scope == nil ? 'Players' : scope.titleize
		Position.joins(:team_role).where(:team_role => {:title => scope})
	end

	def self.team_role_by_campaign_user_ids(ids)
		id = ids.first
		team_role = TeamRole.joins(:campaign_user).where(:campaign_user => id).pluck(:id)
		# scope = scope == nil ? 'Players' : scope.titleize
		Position.joins(:team_role).where(:team_role => team_role)
	end
end
