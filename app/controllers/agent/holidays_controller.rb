
class Agent::HolidaysController < AgentApplicationController

  load_and_authorize_resource

  # GET agent/holidays
  def index
    @holidays = Holiday.agent_scope(current_agent, params[:scope]).includes(:country).order(sort_conditions).page params[:page]

    relevant_pitches = Pitch.by_agent_for_holiday(current_agent, @holidays)
    @holiday_ids_with_pitch = relevant_pitches.map(&:holiday_id).uniq
    @holiday_ids_with_seen_pitch = relevant_pitches.reject{|x|x.seen == false}.map(&:holiday_id).uniq 
  end

  # GET agent/holidays/1
  def show
    @pitch = @holiday.pitches.find_by agent: current_agent
  end

  def pitch
    @pitch = @holiday.pitches.build
    render "agent/pitches/new"
  end


end
