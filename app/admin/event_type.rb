ActiveAdmin.register EventType do

  index :as => :block do |event_type|
    div :for => event_type do
      h2 auto_link(event_type.title)
      div do
        simple_format event_type.title
      end
    end
  end

  menu :parent => "Scheduling"
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
