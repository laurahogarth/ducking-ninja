class Ability
  include CanCan::Ability

  def initialize(user)

    if user.is_a? Traveller
      can :manage, Holiday, :traveller_id => user.id
      can([:read, :update_status], Pitch) { |pitch| user.pitches.ids.include? pitch.id }
    end

    if user.is_a? Agent
      can :manage, Agent, :id => user.id
      can :manage, AgentDetail, :agent_id => user.id
      can :manage, Pitch, :agent_id => user.id
      can :read, Holiday
      can(:pitch, Holiday) { |holiday| !holiday.pitched_on_by? user.id }
    end

  end
end
