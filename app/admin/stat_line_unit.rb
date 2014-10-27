ActiveAdmin.register StatLineUnit do

# config.clear_action_items!

	  menu_options = {
    :priority => 14
  }
  menu menu_options
  navigation_menu :team

  controller do
    # def scoped_collection
    #   StatLineUnit.all.includes(:stat_line_unit, :stat_line, :competition)
    # end

    helper :views
  end

  index do
    # column :competition
    column :person
    column :as_stat_line_unit_type
    # column :stat_line_item
    # column :value
    # column :starts_at, :as => :date_range
    # # column :ends_at, :as => :date_range
    # column :arrival_time
    # # column :event_type, sortable: 'event_types.title'
    # column 'Location', sortable: 'locations.name' do |competition|
    #   location_tooltip(competition.location)
    # end
    # ## TODO Sorting on Owner needs to be fixed because it's only runnning as desc order
    # actions do |competition|
    #   link_to "Add Stats", add_stat_lines_admin_competition_path(competition)
    # end
  end

    filter :person
  # filter :location

  form  do |f|

    f.inputs "Details", :class => 'col-md-8', :type => 'panel' do
      f.input :person
      # f.input :stat_line_entry
      # f.input :value
    end

  end


end