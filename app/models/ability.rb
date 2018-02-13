class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.admin?
        can :manage, :all
      else
        can :manage, BookList, :user_id => user.id
        can :manage, Review, :user_id => user.id
        can :create, :books
        can :update, :books
      end
    else
      can :read, :reviews
      can :read, :books
      can :read, :authors
      can :read, :genres
    end
  end
end
