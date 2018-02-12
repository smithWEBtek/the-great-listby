class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Review
    can :read, Book
    can :read, Author
    can :read, Genre

    unless user.nil?
      can :manage, BookList, { user_id: user.id }
      can :manage, Review, { user_id: user.id }
      can :create, Book
      can :update, Book
    end

    if user.admin?
      can :mange, :all
    end
  end
end
