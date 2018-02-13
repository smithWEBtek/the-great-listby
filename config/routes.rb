Rails.application.routes.draw do
  root 'welcome#home'
  get '/users/:id/reviews' => "users#reviews"

  resources :books do
    resources :reviews
  end

  resources :book_lists do
    resources :books
  end

  resources :authors, only: [:index, :show]
  resources :genres, only: [:index, :show]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
