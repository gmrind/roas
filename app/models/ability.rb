class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role?
      can :manage, :all if user.role == "admin"
    else
      can :read, :all
      can :update, User do |nothing|
        nothing.user.role == user
      end
    end
  end
end
