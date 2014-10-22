class Event < ActiveRecord::Base

  # belongs_to :eventable, :polymorphic => true

	belongs_to :event_type,-> {where('events.as_event_type = event_class')}
	belongs_to :location
	belongs_to :owner, class_name: "Person", primary_key: "user_id"

	has_many :event_groups, autosave: :true, :dependent => :destroy
	# accepts_nested_attributes_for :event_groups
	has_many :groups, :through => :event_groups
	has_many :event_users, foreign_key: "event_id"
	has_many :attendees, class_name: "Person", :through => :event_users, :source => :attendee, :foreign_key => "user_id", :primary_key => "user_id"
	# , foreign_key: "user_id"
	has_many :users, :through => :event_users
	has_many :responses, :dependent => :destroy
  # has_one :competition
  
  belongs_to :organization
  acts_as_tenant(:organization)

  acts_as_superclass# :as => :eventable


  # has_one :g_cal_event

	  scope :between, lambda {|start_time, end_time|
    {:conditions => ["? < starts_at < ?", Event.format_date(start_time), Event.format_date(end_time)] }
  }


  scope :shared_g_cal_events, ->(g_cal_event_ids) { where(g_cal_event_id: g_cal_event_id)}
  scope :all_org_events,->(org_id)  {where(organization_id: org_id)}
  scope :competitions,->  {joins(:event_type).where(:event_types => {:title => 'Competition'})}
  scope :all_org_gshared_events,->(org_id)  {where(organization_id: org_id).where.not(g_cal_event_id: nil)}
  scope :all_org_nativeonly_events,->(org_id)  {where(organization_id: org_id, g_cal_event_id: nil)}
  scope :by_g_cal_event,->(g_cal_event_id) {where(g_cal_event_id: g_cal_event_id)}


def self.awaiting_response
	# event_users = self.all
	@event_users = self.includes(:users)
	return @event_users

end

def self.find_shared_by_g_cal(g_cal_event_id)
  self.by_g_cal_event(g_cal_event_id).pluck(:id)
end

  def self.google_to_native_id_hash(org_id)
   hash = Hash[*self.all_org_gshared_events(org_id).pluck(:g_cal_event_id).zip(self.all_org_gshared_events(org_id).pluck(:id)).flatten]
  end

def self.new_from_g_cal_event(g_cal_event, organization_id)
  new_event_hash     = {
    :name            => g_cal_event['title'],
    :starts_at       => g_cal_event['start'],
    :event_type_id   => nil,
    :location_id     => nil,
    :owner_id        => nil,
    :respond_by      => nil,
    :g_cal_id        => g_cal_event['g_cal_id'],
    :g_cal_event_id  => g_cal_event['g_cal_event_id'],
    :ends_at         => g_cal_event['end'],
    :all_day         => g_cal_event['allDay'],
    :description     => g_cal_event['description'],
    :title           => g_cal_event['title'],
    :organization_id => organization_id,
    :visibility      => nil
  }
  @event             = Event.new(new_event_hash)
end




  # need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.name,
      :description => self.description || "",
      :start => starts_at.rfc822,
      :end => ends_at.rfc822,
      :allDay => self.all_day,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.event_path(id),
      #:color => "red"
    }

  end

  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end


end
