Rails.application.routes.draw do
  devise_for :sitters
  devise_for :owners
  devise_for :users
  # controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get "/dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sitters, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end
  resources :owners, only: [:show]
  resources :jobs, only: [:create, :edit, :update, :new, :show]
  resources :bookings, only: [:show]

end
