module ReviewsHelper

  def user_highest_rated_books(user)
    Book.highest_rated_books.by_user(user).each do |book|
      book
    end
  end

  def user_lowest_rated_books(user)
    Book.lowest_rated_books.by_user(user).each do |book|
      book
    end
  end
  
end
