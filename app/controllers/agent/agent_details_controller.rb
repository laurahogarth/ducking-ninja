class Agent::AgentDetailsController < ApplicationController

  authorize_resource
  before_filter :authenticate_agent!
  before_filter :set_agent_detail


  # GET agent/agent_details/
  def show
  end

  # GET agent/agent_details/edit
  def edit
  end

  # PATCH/PUT agent/agent_details/
  def update   
    if @agent_detail.update(agent_detail_params)
      redirect_to agent_detail_path, notice: 'Agent detail was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private

  def set_agent_detail
    @agent_detail = current_agent.agent_detail || current_agent.create_agent_detail 
  end

  # Only allow a trusted parameter "white list" through.
  def agent_detail_params
    params.require(:agent_detail).permit(:name, :address_1, :address_2, :town, :county, :postcode, :email, :main_phone, :alt_phone, :fax, :managers_name, :opening_hours, :description, :agent_id)
  end
end
