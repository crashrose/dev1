class CampaignUserPosition < ActiveRecord::Base

	belongs_to :campaign_user#, inverse_of: :campaign_user_positions
	has_one :user, :through => :campaign_user#, inverse_of: :campaign_user_positions
	has_one :person, :through => :campaign_user, :order => "first_name || last_name ASC"
	has_one :position, :foreign_key => :id, :primary_key => :position_id
	has_one :parent_position, :through => :position
	has_one :team_role, :through => :position
	has_one :team_role_type, :through => :team_role
	# has_one :position, :foreign_key => :id, :primary_key => :position_id#, inverse_of: :campaign_user_positions
	belongs_to :organization
	# has_one :parent_position, :through => :position, :class_name => "Position"

	acts_as_tenant(:organization)

	scope :players,-> {joins(:team_role_type).where(:team_role_types => {:title => 'Players'})}
	scope :admins,-> {joins(:team_role_type).where(:team_role_types => {:title => 'Administrative Staff'})}
	scope :coaches,-> {joins(:team_role_type).where(:team_role_types => {:title => 'Coaching Staff'})}
	scope :operational,-> {joins(:team_role_type).where(:team_role_types => {:title => 'Operational'})}
	scope :support,-> {joins(:team_role_type).where(:team_role_types => {:title => 'Support'})}
	scope :leadership,-> {joins(:team_role_type).where(:team_role_types => {:title => 'Leadership'})}

end
