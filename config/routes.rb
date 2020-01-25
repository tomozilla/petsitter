Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'sitters/index'
  get 'sitters/show'
  devise_for :sitters
  devise_for :owners
  # devise_for :users,
  # controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sitters, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end
  resources :owners, only: [:show]
  resources :jobs, only: [:create, :edit, :new, :show] do
    resources :bookings, only: [:index]
  end
  resources :bookings, only: [:show]

end
