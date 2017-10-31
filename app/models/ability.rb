class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.member?
      can :read, Driverride
      can :create, Driverride
      can :update, Driverride do |driverride|
        driverride.try(:user) == user
      end
      can :destroy, Driverride do |driverride|
        driverride.try(:user) == user
      end
    else
      can :read, Driverride
    end

    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.member?
      can :read, Passengerride
      can :create, Passengerride
      can :update, Passengerride do |dassengerride|
        dassengerride.try(:user) == user
      end
      can :destroy, Passengerride do |dassengerride|
        dassengerride.try(:user) == user
      end
    else
      can :read, Passengerride
    end

  end
end
