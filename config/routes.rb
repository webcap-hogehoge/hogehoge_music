Rails.application.routes.draw do
  get 'cart_items/index'
  #devise
    devise_for :users

  # end_users
    resources :users, only: [:show, :edit, :update], controller: 'end_users'
    get '/users/:id/reviews', to: 'end_users#review'
    get '/users/:id/liikes', to: 'end_users#likes'
    patch '/users/:id/destroy', to: 'end_users#destroy'
    get '/users/unsubscribe', to: 'end_users#unsubscribe'

  #contacts
    resources :contacts, only: [:new, :create, :index]

  # products
    resources :products, only: [:show]
    root 'products#index'

  #reviews
    # resources :reviews, only: [:new, :create, :edit, :update]
    # post '/reviews/confirm', to: 'reviews#confirm'

  #likes

  #cart_item
    resources :cart_items, only: [:create, :index, :update, :destroy]
end
