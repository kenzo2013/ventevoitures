class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new
    if user.is? :admin
      can :manage, :all
      can :admin, User
    else
      can 
    end

  end
end