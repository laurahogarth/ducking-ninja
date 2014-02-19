module CountriesHelper
  def flag_for(country)
    image_tag country.flag_image
  end
end
