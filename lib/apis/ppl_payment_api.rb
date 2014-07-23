module Apis
  class PplPaymentApi

  	# attr_accessor :api_client
  	# attr_accessor :user_credentials
  	# attr_accessor :calendar_api
  	# attr_accessor :g_cal


   #  def initialize(opts={})
   #    # Build a per-request oauth credential based on token stored in session
   #    # which allows us to use a shared API client.

   #    @api_client = Rails.application.config.google_api_client
   #    @user_credentials = @api_client.authorization.dup

   #    if !!opts[:access_token]
   #      @user_credentials.access_token = opts[:access_token]
   #      @user_credentials.refresh_token = opts[:refresh_token]
   #      @user_credentials.code = opts[:code]
   #      @user_credentials.update_token!
   #    end

   #    if !@user_credentials.refresh_token
   #      redirect_to(@user_credentials.authorization_uri({:access_type => "offline", :approval_prompt => "force"}).to_s)
   #    elsif !@user_credentials.issued_at
   #      @user_credentials.grant_type = 'refresh_token'
   #      @user_credentials.fetch_access_token!
   #      # self.serialize_token
   #    end

   #    # g_cal = GCal.find_by(:organization_id => opts[:organization_id])
   #    @g_cal = opts[:g_cal]
   #    @calendar_api = @api_client.discovered_api('calendar', 'v3')
   #    # @user_credentials

   #  end


   #  def new_g_cal_event(id)
   #    event_data = self.get_g_cal_event(id).data
   #    # event = @api_client.execute(:api_method => @calendar_api.events.get,
   #    #                                       :parameters => {'eventId' => id, 'calendarId' => @g_cal.id},
   #    #                                       :authorization => @user_credentials )
   #    event = event_data
   #    event['g_cal_id'] = @g_cal.g_cal_id
   #    # event['g_cal_tz'] = event_data.timeZone
   #    event = GCalEvent.google_build(event)#self.google_build(event)
   #    return event
   #  end

   #  def get_g_cal_event(id)
   #    g_event = @api_client.execute(:api_method => @calendar_api.events.get,
   #                                          :parameters => {'eventId' => id, 'calendarId' => @g_cal.g_cal_id},
   #                                          :authorization => @user_credentials )
   #    # return event.data
   #  end

   #  def get_g_cal_events
   #    event_list = @api_client.execute(:api_method => @calendar_api.events.list,
   #                                          :parameters => {'calendarId' => @g_cal.g_cal_id,
   #                                                          'singleEvents' => true},
   #                                          :authorization => @user_credentials )
   #  end

   #  def get_g_cal_list
   #    calendar_list = @api_client.execute(:api_method => @calendar_api.calendar_list.list,
   #                                          :parameters => {'minAccessRole' => 'writer'},
   #                                          :authorization => @user_credentials )
   #    gg_cal_list = calendar_list.data.items
   #  end

   #  def build_g_cal_select_list
   #    gg_cal_list = self.get_g_cal_list
   #    all_g_cals = []
   #    gg_cal_list.each do |item|
   #      selected = @g_cal.g_cal_id == item.id ? true : false
   #      item_hash = { :name => item.summary,
   #                    :g_cal_id => item.id,
   #                    :tz => item.timeZone,
   #                    :selected => selected
   #                    # ,
   #                    # :temp => "#{selected}#{item.summary.upcase}"
   #                  }
   #      all_g_cals << item_hash
   #    end

   #    all_g_cals.sort_by {|name, g_cal_id, tz, selected| "#{name.to_s.upcase}"}

   #  end



   #  def update_g_cal_event(g_cal_event_hash, update_fields={})
   #    id = g_cal_event_hash['g_cal_event_id']
   #    event = self.get_g_cal_event(id).data

   #    # if update_fields[:none]
   #    #     #### g_update_fields = { list of all fields }
   #    # else
   #    #   ### iterate through list of passed update_fields
   #    #     ####  update_fields.each do |key|
   #    #       #### if @g_event.key = 


   #    if g_cal_event_hash['allDay'] == "true"
   #      event.start = {'date' =>  g_cal_event_hash['start'].to_date.strftime('%F')}
   #      event.end = {'date' =>  g_cal_event_hash['end'].to_date.tomorrow.strftime('%F')}
   #    else
   #      event.start = {'dateTime' => Time.zone.parse(g_cal_event_hash['start']).strftime('%Y-%m-%dT%H:%M:%S%:z')}
   #      if g_cal_event_hash['start_tz']
   #        event.start['timeZone'] = ActiveSupport::TimeZone.find_tzinfo(g_cal_event_hash['start_tz']).name
   #      end
   #      event.end = {'dateTime' => Time.zone.parse(g_cal_event_hash['end']).strftime('%Y-%m-%dT%H:%M:%S%:z')}
   #      if g_cal_event_hash['end_tz']
   #        event.end['timeZone'] = ActiveSupport::TimeZone.find_tzinfo(g_cal_event_hash['end_tz']).name
   #      end
   #    end

   #    event.summary        =  g_cal_event_hash['title']
   #    event.description  =  g_cal_event_hash['description']
   #    event.location     =  g_cal_event_hash['location']

   #    result = @api_client.execute(:api_method => @calendar_api.events.update,
   #                                          :parameters => {'eventId' => id, 'calendarId' => @g_cal.g_cal_id},
   #                                          :body_object => event,
   #                                          :authorization => @user_credentials
   #                                          )
   #    return result.status
   #  end
  end
end