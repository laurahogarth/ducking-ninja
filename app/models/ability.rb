class Ability
  include CanCan::Ability

  def initialize(user)

    if user.is_a? Traveller
      can :manage, Holiday, :traveller_id => user.id
    end

    if user.is_a? Agent
      can :manage, Agent, :id => user.id
    end

  end
end
