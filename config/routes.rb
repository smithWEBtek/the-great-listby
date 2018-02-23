Rails.application.routes.draw do
  root 'welcome#home'
  get '/users/:id/reviews', to: 'users#reviews', as: 'users_reviews'
  get '/users/:id/highest_rated_books', to: 'users#highest_rated_books', as: 'users_highest_rated_books'
  get '/users/:id/lowest_rated_books', to: 'users#lowest_rated_books', as: 'users_lowest_rated_books'

  resources :books do
    resources :reviews
  end

  resources :book_lists do
    resources :books, only: [:create, :destroy, :new, :edit, :update]
  end

  resources :authors, only: [:index, :show]
  resources :genres, only: [:index, :show]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
