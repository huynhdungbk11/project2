class Ability
  include CanCan::Ability

  def initialize user
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, Suggestion, user_id: user.id
      can :manage, Comment, user_id: user.id
    end
  end
end
