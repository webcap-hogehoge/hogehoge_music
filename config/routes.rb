Rails.application.routes.draw do

    #devise
    devise_for :administrators, controllers: {
      sessions: 'administrators/sessions',
      passwords: 'administrators/password',
      registrations: 'administrators/registrations'
    }

    devise_for :end_users, controllers: {
      sessions:  'end_users/sessions',
      passwords:  'end_users/password',
      registrations: 'end_users/registrations'
    }

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

  #order_history
    resources :order_histories, only: [:new, :index, :show, :create, :edit, :update]
    post 'order_histories/confirm', to: 'order_histories#confirm'
    get 'order_histories/thanks', to: 'order_histories#thanks'


end
