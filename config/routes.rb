Rails.application.routes.draw do
  #devise_for :users

  root 'welcome#home'

  resources :books do
    resources :reviews
  end

  get '/users/:id/reviews' => "users#reviews"

  get '/users/:id/unreadbooks' => "users#unread"

  resources :book_lists do
    resources :books
  end

  resources :authors
  resources :genres

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
