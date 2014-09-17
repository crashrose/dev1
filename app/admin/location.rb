ActiveAdmin.register Location  do

menu_options = {
  :parent =>  :sched
}
menu menu_options

navigation_menu :configure


  index do
    column :name
    # column "Address" do |location|
    #   location.address1.to_s+'<BR>'.html_safe+location.address2.to_s+'<BR>'.html_safe+location.city.to_s+', '+location.state.to_s+' '+location.zip.to_s
    # end
    # column :ends_at, :as => :date_range
    # column :all_day
    # column :event_type
    # column :location
    # column :owner
    # column :respond_by
    actions
  end

permit_params :name, :address, :address2, :city, :state, :zip, :country, :phone, :note, :website, :maplink, :latitude, :longitude
form partial: 'form'

  # form do |f|

  #   f.inputs "Location Details" do
  #     f.input :name
  #     f.input :address
  #     f.input :latitude
  #     f.input :longitude
  #   end

  #   f.actions
  # end

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
