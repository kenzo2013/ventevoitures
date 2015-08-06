class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.is? :admin
      can :manage, :all
    else
      can :manage, Car
    end
  end
end