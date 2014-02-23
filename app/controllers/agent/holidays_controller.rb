
class Agent::HolidaysController < AgentApplicationController

  load_and_authorize_resource

  # GET agent/holidays
  def index
    @holidays = Holiday.all.includes :country
  end

  # GET agent/holidays/1
  def show
    #TODO Scope?
    @pitch = @holiday.pitches.where(:agent_id => current_agent.id).first if @holiday.pitched_on_by? (current_agent.id)
  end

  def pitch
    @pitch = @holiday.pitches.build
    render "agent/pitches/new"
  end

end
