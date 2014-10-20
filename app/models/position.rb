class Position < ActiveRecord::Base

	belongs_to :sport
	belongs_to :team_role#, class_name: "TeamRole", foreign_key: "role_id"

	belongs_to :parent_position, class_name: "Position", primary_key: "parent_id", foreign_key: "id"
	has_many :children, class_name: "Position", foreign_key: "parent_id", primary_key: "id"

	has_many :campaign_user_positions, inverse_of: :position
	has_many :campaign_users, :through => :campaign_user_positions, inverse_of: :positions
	has_many :users, :through => :campaign_users, inverse_of: :positions
	has_many :people, :through => :campaign_users, foreign_key: "user_id", primary_key: "user_id", inverse_of: :positions

	has_many :child_campaign_user_positions, :through => :children, :source => :campaign_user_positions   #, inverse_of: :position
	# has_many :child_campaign_users, :through => :child_campaign_user_positions, :source => :campaign_user
	# has_many :child_users, :through => :child_campaign_users, :source => :user#, inverse_of: :positions
	# has_many :child_people, :through => :child_users, :source => :person


	scope :players,-> {joins(:team_role).where(:team_roles => {:title => 'Players'})}
	scope :admins,-> {joins(:team_role).where(:team_roles => {:title => 'Administrative Staff'})}
	scope :coaches,-> {joins(:team_role).where(:team_roles => {:title => 'Coaching Staff'})}
	scope :others,-> {joins(:team_role).where(:team_roles => {:title => 'Others'})}
	scope :campaign_parents, -> {where('positions.parent_id = positions.id')}

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

	def members_for_parent
		# @data =  self.users.includes(:positions).where(:positions => {:parent_id => self.id})#.all
		@data =  User.includes(:positions).where(:positions => {:parent_id => self.id})#.all
# zzzz
# 		@data.map { |user| "#{user.name} (#{user.campaign_user_positions.map {|campaign_user_positions| campaign_user_positions.id}}.to_sentence)"}.to_sentence
		# @data.map { |user| "#{user.name} (#{user.positions.map {|position| position.abbreviation}.join(', ')})"}.to_sentence
# @data.explain

		# @data = self.users.includes(:campaign_user_positions)#.join(:campaign_user_positions)#.all.inspect
		# @data = self.children.includes(:people).all#.joins(:users, :campaign_user)
		# @data2 = self.children.all
		# grouped = @data.group_by {|full_name| full_name.abbreviation.map {|abbreviation| abbreviation.to_sentence}}
		# User.joins(:parent_positions).all.map {|user| user.positions.map {|position| position.abbreviation}.to_sentence}
	end
end
