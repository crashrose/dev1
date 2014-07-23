ActiveAdmin.register Event do

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

  menu :parent => "Scheduling"

  index do
    column :name
    column :starts_at, :as => :date_range
    column :ends_at, :as => :date_range
    column :all_day
    column :event_type
    column :location
    column :owner
    column :respond_by
    actions
  end


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
end
