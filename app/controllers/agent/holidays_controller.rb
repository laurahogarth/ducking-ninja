
class Agent::HolidaysController < AgentApplicationController

  load_and_authorize_resource

  # GET agent/holidays
  def index
    @holidays = Holiday.agent_scope(current_agent, params[:scope]).page(params[:page]).includes(:country)
    @holiday_ids_with_pitch = Holiday.joins(:pitches).where(:id => @holidays.ids, :pitches => {:agent => current_agent}).ids
    @holiday_ids_with_seen_pitch = Holiday.joins(:pitches).where(:id => @holidays.ids, :pitches => {:agent => current_agent, :seen => true}).ids

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
