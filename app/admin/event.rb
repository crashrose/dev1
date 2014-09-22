ActiveAdmin.register Event do

menu_options = {
  :label => 'Event List',
  :parent =>  :sched
}
menu menu_options

navigation_menu :configure

  controller do
    def scoped_collection
      Event.all.includes :owner, :location, :event_type
    end
    helper :views
  end

  filter :name
  filter :starts_at, :as => :date_range
  filter :ends_at, :as => :date_range
  filter :all_day
  filter :event_type
  filter :location
  filter :groups
  filter :owner
  filter :respond_by
  filter :created_at
  filter :updated_at

  config.sort_order = "starts_at_asc"


  index do
    column :name
    column :starts_at, :as => :date_range
    column :ends_at, :as => :date_range
    column :all_day
    column :event_type, sortable: 'event_types.title'
    column 'Location', sortable: 'locations.name' do |event|
      location_tooltip(event.location)
    end
    ## TODO Sorting on Owner needs to be fixed because it's only runnning as desc order
    column :owner#, sortable: 'people.first_name || people.last_name'
    column :respond_by
    actions
  end

  form  do |f|

    f.inputs "Details" do
      f.input :name, :input_html => {class: 'form-control'}
      f.input :location, :input_html => {class: 'form-control'}
      f.input :event_type, :input_html => {class: 'form-control'}
      f.input :owner, :input_html => {class: 'form-control'}
      f.input :starts_at, :input_html => {class: 'form-control'}
      f.input :ends_at, :input_html => {class: 'form-control'}
      f.input :all_day, :input_html => {class: 'form-control'}
      f.input :respond_by, :input_html => {class: 'form-control'}
      f.input :description, :input_html => {class: 'form-control'}
    end
  end


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
permit_params :name, :starts_at, :ends_at, :event_type_id, :location_id, :owner_id, :all_day, :g_cal_event_id, :g_cal_id, :organization_id, :respond_by, :group_ids, group_ids: [], event_groups_attributes: [ :event_id, :group_id ]
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
end
