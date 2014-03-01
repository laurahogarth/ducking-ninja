module CountriesHelper
  def flag_for(country)
    image_tag country.flag_image, :width => 32
  end

  def add_favourite(country, opts = {})
    @agent_favourite_country_ids ||= current_agent.favourite_countries.pluck(:country_id)
    link_text = @agent_favourite_country_ids.include?(country.id) ? "Remove From" : "Add To"
    link_to("#{link_text} Favourites", toggle_favourite_agent_country_path(country), :class => opts[:class], :method => :patch)
  end
end
