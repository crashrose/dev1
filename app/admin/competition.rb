ActiveAdmin.register Competition do

# config.clear_action_items!

	  menu_options = {
    :priority => 17
  }
  menu menu_options
  navigation_menu :team

permit_params :has_stats, 
              :stat_line_entry_ids,
              stat_line_entry_ids: [],
              stat_line_entries_attributes: [:_destroy, 
                :id,
                :stat_line_id,
                :ccompetition_id,
                :stat_line_entry_unit_ids,
                stat_line_entry_unit_ids: [],
                stat_line_entry_units_attributes:[:_destroy, 
                  :id,
                  :stat_line_entry_id,
                  :stat_line_unit_id,
                  :unit_id,
                  :unit_class,
                  :stat_line_item_entry_ids,
                  stat_line_item_entry_ids: [],
                  stat_line_item_entries_attributes:[
                    :id,
                    :stat_line_item_id,
                    :stat_line_entry_unit_id,
                    :value
                  ]
                ]
              ]
                # , 
                # :stat_line_item_entry_ids,
                # stat_line_item_entry_ids: [],
                # stat_line_item_entries_attributes: [:value, :id]]



  controller do
    def add_stat_lines(competition_id)
      @competition = Competition.find(competition_id).includes( {stat_line_entries: [ { stat_line_entry_units: [:stat_line_item_entries] } ] } )
      # zzzz
      @page_title = "Enter/Edit Statistics for #{@competition.name}"
    end

    def scoped_collection
      Competition.all.includes(event: [:owner, :location, :event_type])
    end

    def update
      # zzzz
      super do |format|
        # zzzzz
        redirect_to collection_url and return if resource.valid?
      end
    end

    helper :views
  end

  member_action :add_stat_lines, method: :get, :title => "Enter/Edit Statistics for #{@resource.name}" do
    @competition = Competition.where(:id => resource.id).includes( {stat_line_entries: [ { stat_line_entry_units: [:stat_line_item_entries, :unit] } ] } ).first
    # zzzz
    respond_with @competition
  end

  index do
    column :name
    column :event_type
    column :starts_at, :as => :date_range
    # column :ends_at, :as => :date_range
    column :arrival_time
    # column :event_type, sortable: 'event_types.title'
    column 'Location', sortable: 'locations.name' do |competition|
      location_tooltip(competition.location)
    end
    ## TODO Sorting on Owner needs to be fixed because it's only runnning as desc order
    actions do |competition|
      link_to "Add Stats", add_stat_lines_admin_competition_path(competition)
    end
  end

    filter :event_type
  filter :location

  # form  do |f|

    # f.inputs "Details", :class => 'col-md-8', :type => 'panel' do
    #   f.input :name
    #   f.input :description
    #   f.input :location
    #   # f.input :event_type
    #   # f.association :owner
    #   f.input :starts_at, :as => :datetime_picker, :input_html => {:data => {:date_format => "M/D/YY h:mm A"}}
    #   f.input :ends_at, :as => :datetime_picker, :input_html => {:data => {:date_format => "M/D/YY h:mm A"}}
    #   f.input :all_day, :as => :boolean, :boolean_style => :inline, :input_html => {:data => {:toggle => "toggle", :on => 'Yes', :off => 'No', :size => 'small'}}
    #   f.input :respond_by, :as => :datetime_picker, :input_html => {:data => {:date_format => "M/D/YY h:mm A"}}
    #   f.has_many :line_entry_units, allow_destroy: true, new_record: true, :type => 'inner-panel' do |a|
    #     a.input :line_item
    #     # a.input :field_type
    #       # a.has_many :line_entry_units, allow_destroy: true, new_record: true, :type => 'inner-panel' do |b|
    #       #   b.input :line_item
    #       #   b.association :unit
    #       # end
    #   end
    # end



  form do |f|
    f.inputs "Details", :class => 'col-md-4', :type => 'panel' do
      f.input :name
      f.input :description
      f.input :location
      f.input :event_type
    end
    f.inputs "Fields", :class => 'col-md-4', :type => 'panel' do 
      f.has_many :stat_line_entries, sortable: false, allow_destroy: true, new_record: true, :type => 'inner-panel' do |a|
        a.association :stat_line
        # a.has_many :stat_line_entries, sortable: false, allow_destroy: true, new_record: true, :type => 'inner-panel' do |b|
        #   b.input :stat_line
        # end
      end
    end
    f.actions
  end
#     f.inputs "Game Details", :class => 'col-md-8', :type => 'panel' do
# # f.input :lineup_id, 
# f.association :campaign
# f.input :has_stats, :boolean_style => :inline, :input_html => {:data => {:toggle => "toggle", :on => 'Yes', :off => 'No', :size => 'small'}}
# f.input :stats_complete, :boolean_style => :inline, :input_html => {:data => {:toggle => "toggle", :on => 'Yes', :off => 'No', :size => 'small'}}
# # f.input :opponent_id
# # f.input :uniform_id
# f.input :is_home_game, :boolean_style => :inline, :input_html => {:data => {:toggle => "toggle", :on => 'Yes', :off => 'No', :size => 'small'}}
# # f.input :transport_plan_id
# f.input :arrival_time, :as => :datetime_picker, :input_html => {:data => {:date_format => "M/D/YY h:mm A"}}
# f.input :start_time, :as => :datetime_picker, :input_html => {:data => {:date_format => "M/D/YY h:mm A"}}
# f.input :expected_duration
# f.association :event_type
    # f.inputs "Fields", :class => 'col-md-4', :type => 'panel' do 

    # end
    # end

  # end


end