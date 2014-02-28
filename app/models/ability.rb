class Ability
  include CanCan::Ability

  def initialize(user)

    if user.is_a? Traveller
      can([:read, :update_status], Pitch) { |pitch| user.pitches.ids.include? pitch.id }
      can :manage, Holiday, :traveller_id => user.id
      cannot([:edit, :update], Holiday) { |holiday| holiday.pitches.any? }
    end

    if user.is_a? Agent
      can :manage, Agent, :id => user.id
      can :manage, AgentDetail, :agent_id => user.id
      can :manage, Pitch, :agent_id => user.id
      can :read, Holiday
      can(:pitch, Holiday) do |holiday| 
        !holiday.pitched_on_by?(user.id) and holiday.open?
      end
      cannot([:edit, :update], Pitch) { |pitch| pitch.seen? }
    end

  end
end
