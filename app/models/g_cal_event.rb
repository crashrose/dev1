class GCalEvent < ActiveRecord::Base
	require 'activerecord-tableless'
  require 'tzinfo'
  require 'active_support/time_with_zone'
  require 'active_support'
  require 'rubygems'

 	has_no_table

  column :id, :string
  column :g_cal_event_id, :string
  column :g_iCal_uid, :string
  column :native_event_id, :integer
  column :title, :string
  column :description, :string
  column :start, :datetime
  column :end, :datetime
  column :start_tz
  column :end_tz
  column :allDay, :boolean
  column :url, :string
  column :location 
  column :g_cal_id
  column :g_cal_tz
  column :is_shared, :boolean


#### TO DO ####
# Build method for stripped-down list of events that gets fed to Java for calendar
# display since the calendar display doesn't use all of the  model data.



  def self.build_events(data, g_cal_id, org_id)
    @events = []
    g_cal_tz = data.timeZone

## TO DO
## Consider reworking this to select all where g_cal_id matches and then iterate thru records matching has keys from api results
    native_event_ids = Event.google_to_native_id_hash(org_id)
    data.items.each do |item|
      item['g_cal_id'] = g_cal_id
      item['g_cal_tz'] = g_cal_tz
      item['g_cal_event_id'] = item['id']
      if native_event_ids.has_key?(item['id'])
        is_shared =  true 
        item['id'] = native_event_ids[item['id']].to_s
        item['native_event_id'] = native_event_ids[item['id']]
        item['is_shared'] = true
      else
        is_shared =  false 
        item['is_shared'] = false
        item['id'] = "g_cal_#{item['id']}"
        item['native_event_id'] = nil
      end
      gevent = self.google_build(item, is_shared)
      @events << gevent
    end

    nevents = Event.all_org_nativeonly_events(org_id)
    nevents.each do |item|
      nevent = self.native_build(item)
      @events << nevent
    end

    return @events
  end

def self.google_build(item, is_shared=nil)

  if is_shared == nil
    item['g_cal_event_id'] = item['id'] 
    native_event = Event.find_shared_by_g_cal(item['g_cal_event_id'])

    if !(native_event.blank?)
      item['id'] = native_event
      item['is_shared'] = true
      item['native_event_id'] = native_event
    else
      item['id'] = "g_cal_#{item['id']}"
      item['is_shared'] = false
      item['native_event_id'] = nil
    end
  end

  if !!item['start']['date']
    all_day = true
    startdate = item['start']['date'].to_date.beginning_of_day
    enddate = item['end']['date'].to_date.beginning_of_day - 1
    start_tz = nil #ActiveSupport::TimeZone.find_tzinfo(item['g_cal_tz']).name
    end_tz = nil #ActiveSupport::TimeZone.find_tzinfo(item['g_cal_tz']).name
    
  else
    all_day = false
    startdate = item['start']['dateTime'].utc
    enddate = item['end']['dateTime'].utc
    start_tz = !!item['start']['timeZone'] ? ActiveSupport::TimeZone::MAPPING.key(item['start']['timeZone']) : nil
    end_tz = !!item['end']['timeZone'] ? ActiveSupport::TimeZone::MAPPING.key(item['end']['timeZone']) : nil
  end
  cal_tz = item['g_cal_tz']

  @event = GCalEvent.new({
    :id                 =>  item['id'],
    :title              =>  item['summary'],   
    :description        =>  item['description'],     
    :start              =>  startdate,
    :end                =>  enddate,
    :start_tz           =>  start_tz,
    :end_tz             =>  end_tz,
    :allDay             =>  all_day, 
    :url                =>  item['htmlLink'],
    :location           =>  item['location'],
    :native_event_id    =>  item['native_event_id'],
    :g_cal_event_id     =>  item['g_cal_event_id'],
    :g_iCal_uid         =>  item['iCalUID'],
    :g_cal_id           =>  item['g_cal_id'],
    :g_cal_tz           =>  cal_tz,
    :is_shared          =>  item['is_shared']
    })
	return @event
end

def self.native_build(item)

  @event = GCalEvent.new({
      :id                 =>  item.id,
      :title              =>  item.name,   
      :description        =>  item.description,     
      :start              =>  item.starts_at,
      :end                =>  item.ends_at,
      :start_tz           =>  nil,
      :end_tz             =>  nil,
      # :start_tz           =>  item.starts_at.zone,
      # :end_tz             =>  item.ends_at.zone,
      :allDay             =>  item.all_day, 
      :url                =>  nil,
      :location           =>  item.location.name,
      :native_event_id    =>  item.id,
      :g_cal_event_id     =>  nil,
      :g_iCal_uid         =>  nil,
      :g_cal_id           =>  nil, 
      :g_cal_tz           =>  nil,
      :is_shared          =>  false

}
    )
	return @event
end


# def title
# 	@title = self.summary
# end

# def title=(title)
# 	@title = self.summary
# end

  def as_json(options = {})
    {
      :id => self.id,
      :title => self.title,
      :description => self.description || "",
      :start => self.start,
      :end => self.end,
      :allDay => self.allDay,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.event_path(id)
      # ,
      # :is_shared => self.is_shared
      #:color => "red"
    }

  end

  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

  # def all_day=(all_day)
  #   @all_day = !!self.start.date ? :true : :false
  # end

  # def setAll_day(item)
  #   @all_day = !!item.start.date ? :true : :false
  # end



  # def self.api_connection
  #   @api_connection = GCalEvents.build_g_cal_api
  # end

  # def api_connection=(api_connection=nil)
  #   # @api_client = GCalEvents.api_client
  #   # @user_credentials = GCalEvents.user_credentials
  #   # @calendar_api = GCalEvents.calendar_api
  #   # @g_cal_id = GCalEvents.g_cal_id
  #   if !api_connection
  #     api_connection = self.api_connection
  #   end
  #   @api_connection = api_connection
  # end

  # # def self.get_g_cal_id(org_id)
  # #   g_cal = GCal.find_by(:organization_id => org_id)
  # #   g_cal_id = g_cal.g_cal_id
  # # end
  # def self.new_g_cal_event(id)
  #   self.api_connection
  # # def self.new_g_cal_event(session,id)
  #   # self.get_api(session)
  #   # g_cal = GCal.find_by(:organization_id => session[:organization_id])
  #   # calendar = @api_client.discovered_api('calendar', 'v3')
  #   # request = @api_client.generate_request(:api_method => calendar.events.get,
  #   #                                       :parameters => {'eventId' => id, 'calendarId' => g_cal.g_cal_id}
  #   #                                       )
  #   event = @api_connection.api_client.execute(:api_method => @api_connection.calendar_api.events.get,
  #                                         :parameters => {'eventId' => id, 'calendarId' => @api_connection.g_cal_id},
  #                                         :authorization => @api_connection.credentials )
  #   @event = self.google_build(event.data, @api_connection.g_cal_id)#self.google_build(event)
  # end

#   def self.get_g_cal_events(api_connection)

#   # def self.get_g_cal_events(g_cal_id)
#     # self.api_connection
#     # self.get_api(session)
#     # calendar = @api_client.discovered_api('calendar', 'v3')
#     # request = @api_client.generate_request(:api_method => @api_connection.calendar_api.events.list,
#     #                                       :parameters => {'calendarId' => g_cal_id}
#     #                                       )
#     @event_list = api_connection.api_client.execute(:api_method => api_connection.calendar_api.events.list,
#                                           :parameters => {'calendarId' => api_connection.g_cal_id},
#                                           :authorization => api_connection.credentials )
#   end

#   def self.update_g_cal_event(id)
#     self.api_connection
#   # def self.new_g_cal_event(session,id)
#     # self.get_api(session)
#     # g_cal = GCal.find_by(:organization_id => session[:organization_id])
#     # calendar = @api_client.discovered_api('calendar', 'v3')
#     # request = @api_client.generate_request(:api_method => calendar.events.get,
#     #                                       :parameters => {'eventId' => id, 'calendarId' => g_cal.g_cal_id}
#     #                                       )
#     event = @api_connection.api_client.execute(:api_method => @api_connection.calendar_api.events.get,
#                                           :parameters => {'eventId' => id, 'calendarId' => @api_connection.g_cal_id},
#                                           :authorization => @api_connection.credentials )
#     @event = self.google_build(event.data, @api_connection.g_cal_id)#self.google_build(event)
#   end

# def self.get_api(session_data)
#       @user_credentials = Rails.application.config.google_api_client.authorization.dup
#     @api_client = Rails.application.config.google_api_client
#     if !session_data[:access_token]
#       redirect_to(@user_credentials.authorization_uri({:access_type => "offline", :approval_prompt => "force"}).to_s)
#     else
#       @user_credentials.access_token = session_data[:access_token] 
#       @user_credentials.refresh_token = session_data[:refresh_token] 
#       @user_credentials.code = session_data[:code] 
#       @user_credentials.update_token!
#     end
# end


  #   def start=(start)
  # 	@start = !!self.start['datetime'] ? self.start.['datetime'] : self.start.date
  # end

end