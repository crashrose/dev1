# ActiveAdmin.register Competitionbak do

#   menu_options = {
#     :priority => 17
#   }
#   menu menu_options
#   navigation_menu :team

#   controller do
#     def scoped_collection
#       Competition.all.includes(event: [:owner, :location, :event_type])
#     end
#     helper :views
#   end

#   filter :campaign


#   config.sort_order = "start_time_asc"


#   index do
#     column :event
#     column :start_time
#     column :is_home_game
#     column 'Location', sortable: 'locations.name' do |competition|
#       location_tooltip(competition.event.location)
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
# permit_params :arrival_time, :opponent, :has_stats, :stats_complete, :group_ids, group_ids: [], event_groups_attributes: [ :event_id, :group_id ],
#  event_attributes: [:name, :starts_at, :ends_at, :event_type_id, :location_id, :owner_id,
#  :all_day, :g_cal_event_id, :g_cal_id, :organization_id,
#  :respond_by]
#   #
#   # or
#   #
#   # permit_params do
#   #  permitted = [:permitted, :attributes]
#   #  permitted << :other if resource.something?
#   #  permitted
#   # end
# end
