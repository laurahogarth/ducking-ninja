
class Agent::CountriesController < ApplicationController
  def index
    @letter = params[:letter] || "A"
    @countries = Country.starting_with(@letter).includes(:holidays)
  end

  def holidays
    @country = Country.find(params[:id])
    @holidays = Holiday.agent_scope(current_agent, params[:scope]).where(:country => @country).includes(:country).page params[:page]

    relevant_pitches = Pitch.by_agent_for_holiday(current_agent, @holidays)
    @holiday_ids_with_pitch = relevant_pitches.map(&:holiday_id).uniq
    @holiday_ids_with_seen_pitch = relevant_pitches.reject{|x|x.seen == false}.map(&:holiday_id).uniq 
  end

  def toggle_favourite
    @country = Country.find(params[:id])
    is_favourite = FavouriteCountry.toggle(current_agent, @country)
    redirect_to request.referrer, notice: "#{@country.name} #{is_favourite ? "Added to" : "Removed from"} Favourites"
  end
end
