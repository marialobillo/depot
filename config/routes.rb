Rails.application.routes.draw do
  get 'admin/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  resources :orders
  resources :line_items
  resources :carts

  #get 'store/index'
  resources :products do
    get :who_bought, on: :member
  end

  root 'store#index', as: 'store'
end
