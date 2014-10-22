# ActiveAdmin.register Event, as: 'Competition' do

#   menu_options = {
#     :priority => 17
#   }
#   menu menu_options
#   navigation_menu :team

#   controller do
#     def scoped_collection
#       Event.competitions.includes :owner, :location, :event_type, :competition
#     end
#     helper :views
#   end

#   filter :name
#   filter :starts_at, :as => :date_range
#   filter :ends_at, :as => :date_range
#   filter :location
#   filter :groups
#   filter :owner
#   filter :respond_by

#   config.sort_order = "starts_at_asc"


#   index do
#     column :name
#     column :starts_at, :as => :date_range
#     column :ends_at, :as => :date_range
#     column 'Location', sortable: 'locations.name' do |event|
#       location_tooltip(event.location)
#     end
#     ## TODO Sorting on Owner needs to be fixed because it's only runnning as desc order
#     column :owner#, sortable: 'people.first_name || people.last_name'
#     column :respond_by
#     actions
#   end

#   form  do |f|

#     f.inputs "Details", :class => 'col-md-8', :type => 'panel' do
#       f.input :name
#       f.input :description
#       f.input :location
#       f.input :event_type
#       f.input :owner
#       f.input :starts_at, :as => :datetime
#       f.input :ends_at, :as => :datetime
#       f.input :all_day
#       f.input :respond_by, :as => :datetime
      
#     end
#   end


#   # See permitted parameters documentation:
#   # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#   #
# permit_params :name, :starts_at, :ends_at, :event_type_id, :location_id,
#  :owner_id, :all_day, :g_cal_event_id, :g_cal_id, :organization_id,
#   :respond_by,
#   :competition_id, competition_attributes: [:event_id, :lineup_id, :campaign_id, :has_stats,
#    :stats_complete, :opponent_id, :uniform_id, :is_home_game, :transport_plan_id,
#     :arrival_time, :start_time, :expected_duration, :competition_type_id],
#    :group_ids, group_ids: [], event_groups_attributes: [ :event_id, :group_id ]
#   #
#   # or
#   #
#   # permit_params do
#   #  permitted = [:permitted, :attributes]
#   #  permitted << :other if resource.something?
#   #  permitted
#   # end
# end
