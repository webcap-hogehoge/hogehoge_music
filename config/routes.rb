Rails.application.routes.draw do



#devise
  devise_for :end_users, controllers: {
    sessions:  'end_users/sessions',
    passwords:  'end_users/password',
    registrations: 'end_users/registrations'
  }

  devise_scope :end_user do
    post 'end_users/sign_up/confirm' => 'end_users/registrations#confirm'
    post 'end_users/sign_up/complete' => 'end_users/registrations#complete'
  end

  devise_for :administrators, controllers: {
    sessions: 'administrators/sessions',
    passwords: 'administrators/password',
    registrations: 'administrators/registrations'
  }

# エンドユーザー側
  #end_users

  #addresses
    resources :addresses, only: [:new, :create, :edit, :update, :destroy]
    get '/addresses/:id/edit', to: 'end_users#show'

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
  #admin_order_histories
  # resources :admin_order_histories, only: [:index]
  get 'admin_order_histories' => 'admin_order_histories#admin_index'

  #cart_item
    resources :cart_items, only: [:create, :index, :update, :destroy]
end
