module AgentsHelper

  def setup_new_agent(agent)
    agent.build_agent_detail
    agent
  end
end
