class Ability
  include CanCan::Ability

  def initialize(user)

    if user.is_a? Traveller
      can :manage, Holiday, :traveller_id => user.id
    end

    if user.is_a? Agent
      can :manage, Agent, :id => user.id
      can :manage, AgentDetail, :agent_id => user.id
      can :manage, Pitch, :agent_id => user.id
      can :read, Holiday
    end

  end
end
