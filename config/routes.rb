Rails.application.routes.draw do

  devise_for :sitters
  devise_for :owners
  devise_for :users
  # controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  get "/dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sitters, only: [:show] do
  # show action is for detailed sitter view
    resources :reviews, only: [:new, :create]
  end
  resources :owners, only: [:show]
  # not sure if we need owners#show but keeping for now
  resources :jobs, only: [:create, :update, :new, :show] do
    resources :bookings, only: [:create]
  # booking is created when a sitter is booked in jobs#show
  end
  resources :bookings, only: [:show, :update]

end
