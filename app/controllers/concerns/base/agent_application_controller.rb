class AgentApplicationController < ApplicationController
  before_filter :authenticate_agent!
  before_filter :check_verified!

  private
  def check_verified!
    redirect_to agent_awaiting_verification_path unless current_agent.verified?
  end
end
