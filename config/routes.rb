Rails.application.routes.draw do

  get 'arrival_histories/new'
  get 'disks/new'

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



    resources :users, only: [:show, :edit, :update], controller: 'end_users'
    get '/users/:id/reviews', to: 'end_users#review'
    get '/users/:id/liikes', to: 'end_users#likes'
    post '/users/:id/destroy', to: 'end_users#destroy'
    get '/unsubscribe', to: 'end_users#unsubscribe'  #get 'users/unsubscribe' を　get '/unsubscribe'に変更
  #contacts
    resources :contacts, only: [:new, :create, :index]

  # products
    resources :products, only: [:show, :create, :edit, :update, :new]
    delete '/products/:id/delete', to: 'products#destroy'
    root 'products#index'

  #reviews
    # resources :reviews, only: [:new, :create, :edit, :update]
    # post '/reviews/confirm', to: 'reviews#confirm'

  #likes
  #admin_order_histories
  # resources :admin_order_histories, only: [:index]
  get 'admin_order_histories' => 'admin_order_histories#admin_index'

  #cart_item
    resources :cart_items, only: [:create, :index, :update, :edit, :destroy]

  #order_history
    get 'order_histories/thanks', to: 'order_histories#thanks'
    post 'order_histories/confirm', to: 'order_histories#confirm'
    patch 'order_histories', to: 'order_histories#update_product_number'
    post 'order_histories/new', to: 'order_histories#back'
    resources :order_histories, only: [:new, :index, :show, :create, :edit, :update]


# 管理者側
  #administrator_products
    get '/admin', to: 'products#admin_index', as: 'admin_root'

    get '/admin/products/:id', to: 'products#admin_show', as: 'admin_product'


  #end_user
  scope :admin do
    resources :end_users, only: [:index, :edit, :update]
  end
  get '/admin/end_users/:id', to: 'end_users#admin_show', as: 'admin_end_users'
  post '/admin/end_users/:id/destroy', to: 'end_users#admin_end_user_destroy'

  #arrival_histrory
  resources :arrival_histories, only: [:index, :create]
  get 'arrival_histrories/new/:id', to: 'arrival_histories#new', as: 'new_arrival_history'

end
