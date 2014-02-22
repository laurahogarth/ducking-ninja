ActiveAdmin.register Country do

  filter :name
  filter :iso_2
  config.sort_order = "name_asc"
  permit_params :name, :iso_2

  index do
    column "Name" do |country|
      link_to country.name, admin_country_path(country)
    end
    column :iso_2
    actions
  end
 
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
    #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
