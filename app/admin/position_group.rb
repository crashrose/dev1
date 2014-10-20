ActiveAdmin.register Position, as: 'PositionGroup'  do

  menu_options = {
    :label =>  'Roster by Position',
    :priority =>  18
  }
  menu menu_options
navigation_menu :team

config.filters = false
config.paginate = false

  scope :players, :default => true, :show_count => false
  scope :coaches, :show_count => false
  scope :admins, :show_count => false
  scope :others, :show_count => false

  controller do
    def scoped_collection
      Position.campaign_parents.includes(child_campaign_user_positions: [:person, :position, :campaign_user, :organization]).where.not(:campaign_user_positions => {:position_id => nil})
    end

    helper :views

    def create
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
   
    def update
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
    # helper :views
  end

  permit_params  :name, :start_date, :end_date

  index as: :block, pagination_total: false do |position_group|
    div for: position_group  do
      div  class: "row" do
        resource_selection_cell position_group
        h2  auto_link     position_group.title.pluralize
        position_group.child_campaign_user_positions.group_by(&:person).each do |person, positions|
          div class: "col-md-3" do
            div class: "panel panel-default" do
              div class: "panel panel-heading" do
        #         # h4 text_node user.inspect
        #         # h4 text_node position.inspect
                h4 text_node "#{person.first_name} #{person.last_name}"
                h4 text_node positions.map {|c_u_position| c_u_position.position.abbreviation}.join(', ')
              end
              div class: "panel panel-body" do
                text_node 'Player picture here'
                text_node 'Height:'
                h4 text_node 'Weight:'
                h4 text_node link_to "<span>Player Stats</span>".html_safe, collection_url
              end
            end
          end
        end
      end
    end
  end

#   index do
#     selectable_column
#     column 'Group' do |parent_position|
#       "#{parent_position.title.pluralize} (#{parent_position.abbreviation})"
#     end
#     column 'Children' do |parent_position|
#       parent_position.children.map { |position| position.abbreviation }.to_sentence.html_safe
#     end
#     column 'Players' do |parent_position|
#       # User.joins(:positions).select('positions.abbreviation').group('users.id').explain

#       parent_position.members_for_parent
#       # parent_position.users.map { |user| "#{user.name} (#{user.positions.map {|position| position.abbreviation}}.to_sentence)"}.to_sentence
#       #.map  { |user| "#{user.name} ()"}.to_sentence
# #                                                                user.positions.map {|positions| position.abbreviation}.to_sentence +")" 
# # }.to_sentence
#     end
#     actions
#   end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  # form do |f|
  #   f.inputs "Position Details" do
  #     f.input :name
  #     f.input :start_date
  #     f.input :end_date
  #   end
  #   f.actions
  # end

end
