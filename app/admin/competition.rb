ActiveAdmin.register Competition do

# config.clear_action_items!

	  menu_options = {
    :priority => 17
  }
  menu menu_options
  navigation_menu :team
config.batch_actions = false

permit_params :has_stats, 
              :stat_line_entry_ids,
              stat_line_entry_ids: [],
              stat_line_entries_attributes: [:_destroy, 
                :id,
                :stat_line_id,
                :competition_id,
                :person_id,
                :stat_line_item_entry_ids,
                stat_line_item_entry_ids: [],
                stat_line_item_entries_attributes:[
                  :id,
                  :stat_line_item_id,
                  :stat_line_entry_unit_id,
                  :value
                ]
              ]
                # , 
                # :stat_line_item_entry_ids,
                # stat_line_item_entry_ids: [],
                # stat_line_item_entries_attributes: [:value, :id]]



  controller do
    # def add_stat_lines(competition_id)
    #   @competition = Competition.find(competition_id).includes( {stat_line_entries: [ { stat_line_entry_units: [:stat_line_item_entries] } ] } )
    #   # zzzz
    #   @page_title = "Enter/Edit Statistics for #{@competition.name}"
    # end

    def add_stats_by_person(person_id, competition_id)
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
    # @competition = Competition.where(:id => resource.id).includes( {stat_line_entries: [:stat_line_item_entries, :person] } ).first
    # @competition = Competition.where(:id => resource.id).includes(:stat_lines, {stat_line_entries: [:stat_line_item_entries, :person] } ).first#.group_by(&:stat_lines)
    @competition = Competition.includes(:stat_lines => :stat_line_items, :stat_line_entries => [:person, :stat_line, :stat_line_items, {:stat_line_item_entries => :stat_line_item}]).where(:id => resource.id, :stat_lines => {:is_calc_only => false}).first
    # @competition.load_statistics
    # Competition.where(:id => 1).includes(:stat_lines, {stat_line_entries: [:stat_line_item_entries, :person] } ).group_by(&:stat_lines)
    # zzzz
    respond_with @competition
  end

  member_action :manage_lineup, method: :get, :title => "Manage Lineups for #{@resource.name}" do
    @competition = Competition.where(:id => resource.id).first
    respond_with @competition
  end

  member_action :add_stats_by_person, method: :get, :title => "Enter/Edit Statistics for #{@resource.name}" do
    @competition = Competition.includes(:stat_lines => :stat_line_items, :stat_line_entries => [:person, :stat_line, :stat_line_items, {:stat_line_item_entries => :stat_line_item}]).where(:id => resource.id).first
    
    # xxxxx
    respond_with @competition
  end

# index :as => :block do |competition|
#     div :for => competition do
#       div class: "col-md-12" do
#         div class: "row" do
#           div class: "col-md-4" do
#             h2 auto_link(competition.name)
#           end
#           div class: "col-md-4" do
#             h2 ".vs Opponent"
#           div class: "col-md-4" do
#             h2 "Date"
#             h2 "Location"
#           end
#         end
#         div class: "row" do
#         end
#       end
#     end
#   end
# end
# index 

  index :as => :block, download_links: false do |competition|
    div :for => competition do

        div class: "col-md-7" do
          div class: "row" do
            div class: "show-borders col-md-3 " do
              # div class: "row" do
                div class: "col-md-12" do
                  h3 class: "block-text" do
                    text_node competition.starts_at.strftime("%A").upcase
                  end
                end
              # end
              # div class: "row container-fluid" do
                div class: "date-float" do
                  h1 class: "competition-month" do
                    competition.starts_at.strftime("%b").upcase
                  end
                  h1 class: "competition-date" do
                    competition.starts_at.strftime("%d").upcase
                  end
                end
                # div class: "year-float" do
                  div class: "rotation-outer" do
                    div class: "rotation-inner rotate" do
                      h1 class: "vertical-text-year backup" do
                        competition.starts_at.strftime("%Y").upcase
                      end
                    end
                  # end
                end
              # end
              # div class: "row" do
                div class: "col-md-12 trim-h" do
                  h2 class: "competition-time" do
                    # text_node "<small>at </small>".html_safe
                    # text_node "12:59p"
                    text_node competition.starts_at.strftime("%l:%M %P").gsub(' pm', 'p').gsub(' am', 'a')
                    text_node "<small> #{competition.starts_at.strftime('%Z')}</small>".html_safe
                  end
                end
              # end
              # h2 auto_link(competition.name)
            end

            # @ / .vs  -- home/away indicator
            div class: "col-md-2 competition-versus" do
              if competition.is_home_game != true
                div class: "col-md-12" do
                  h2 class: "trim-h" do
                      text_node "@"
                  end
                end
                div class: "col-md-12" do
                  h4 class: "trim-h" do
                    span class: "label label-primary" do
                      text_node "AWAY"
                    end
                  end
                end
              else
                div class: "col-md-12" do
                  h1 class: "trim-h" do
                      text_node "vs."
                  end
                end
                div class: "col-md-12" do
                  h4 class: "trim-h" do
                    span class: "label label-success" do
                      text_node "HOME"
                    end
                  end
                end
              end
            end

            # Opponent Details
            div class: "col-md-7" do
              h2 text_node competition.opponent.name
            end

          end

          div class: "row" do
            div class: "col-md-4" do
              h3 text_node "Competition Details"
            end
            div class: "col-md-4" do
              h3 text_node "Lineup"
              competition.lineup_platoons.each do |lineup_platoon|
                div class: "row single-border" do
                  div class: "col-md-4" do
                    h4 class: "temp" do 
                      text_node lineup_platoon.platoon_area.name
                    end
                    text_node link_to "Manage", manage_lineup_admin_competition_path(competition, anchor: lineup_platoon.platoon_area.name.parameterize)
                  end
                  div class: "col-md-8" do
                    h5 text_node "Starting Formation:" 
                    h4 class: "temp" do
                      text_node  lineup_platoon.starting_lineup_formation.name
                    end
                    text_node lineup_platoon.starting_lineup_formation.lineup_players.count.to_s + '/' +
                      lineup_platoon.starting_lineup_formation.formation.formation_positions.count.to_s + ' positions filled. '
                  end
                end
              end
            end
            div class: "col-md-4" do
              h4 text_node "Manage Statistics"
              # h5 text_node 
              text_node link_to "Enter/Edit All Stats", add_stat_lines_admin_competition_path(competition)
              
              h5 text_node "Enter Stats by Player"
              render partial: 'stats_player_select', locals: {competition: competition}
            end
          end
        end

    end
  end



  # index do
  #   column :name
  #   column :event_type
  #   column :starts_at, :as => :date_range
  #   column :arrival_time
  #   column 'Location', sortable: 'locations.name' do |competition|
  #     location_tooltip(competition.location)
  #   end
  #   ## TODO Sorting on Owner needs to be fixed because it's only runnning as desc order
  #   actions do |competition|
  #     link_to "Add Stats", add_stat_lines_admin_competition_path(competition)
  #   end
  # end

config.filters = false

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

form partial: 'form'

  # form do |f|
  #   f.inputs "Details", :class => 'col-md-4', :type => 'panel' do
  #     f.input :name
  #     f.input :description
  #     f.input :location
  #     f.input :event_type
  #   end
  #   f.inputs "Fields", :class => 'col-md-4', :type => 'panel' do 
  #     f.has_many :stat_line_entries, sortable: false, allow_destroy: true, new_record: true, :type => 'inner-panel' do |a|
  #       a.association :stat_line
  #       # a.has_many :stat_line_entries, sortable: false, allow_destroy: true, new_record: true, :type => 'inner-panel' do |b|
  #       #   b.input :stat_line
  #       # end
  #     end
  #   end
  #   f.actions
  # end
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