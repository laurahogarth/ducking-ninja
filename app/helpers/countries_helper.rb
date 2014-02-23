module CountriesHelper
  def flag_for(country)
    image_tag country.flag_image, :width => 32
  end
end
