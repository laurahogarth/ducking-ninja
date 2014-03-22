module CountriesHelper
  def flag_for(country)
    image_tag country.flag_image, :width => 32
  end

  def toggle_favourite(country, opts = {})
    @agent_favourite_country_ids ||= current_agent.favourite_countries.pluck(:country_id)
    is_favourite = @agent_favourite_country_ids.include?(country.id) 

    link_to(toggle_favourite_agent_country_path(country), :class => opts[:class], :method => :patch) do
      if is_favourite
        raw "#{icon 'times'} Remove From Favourites"
      else
        raw "#{icon 'heart'} Add To Favourites"
      end
    end
  end
end
