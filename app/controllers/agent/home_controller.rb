class Agent::HomeController < AgentApplicationController

  skip_before_filter :check_verified!, only: :awaiting_verification

  def index    
    @top_destinations = Country.select("countries.*, count(holidays.id) AS holidays_count" ).
      joins( "LEFT OUTER JOIN holidays ON holidays.country_id = countries.id" ).
      where( "holidays.open = 't'").
      group( "countries.name").
      order( "holidays_count desc").
      limit(20)

    @recent_unpitched = Holiday.unpitched_on_by(current_agent).limit(5).includes(:country)    
    @recent_favourites = Holiday.unpitched_on_by(current_agent).in_countries(current_agent.favourite_countries.pluck(:country_id)).limit(5).includes(:country)

  end

  def awaiting_verification
    redirect_to agent_root_path if current_agent.verified?
  end

end
