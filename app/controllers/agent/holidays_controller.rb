
class Agent::HolidaysController < AgentApplicationController

  load_and_authorize_resource

  # GET agent/holidays
  def index
    @holidays = Holiday.all.includes(:country, :agents).page params[:page]
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
