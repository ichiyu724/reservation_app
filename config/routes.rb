Rails.application.routes.draw do
  root 'home#top'
  
  get 'users/profile', to:'users#profile', as: :profile
  get 'users/account', to:'users#account', as: :account
  resources :users, only: [:edit, :update] 
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'reservations/new', to:'reservations#new'
  resources :rooms do
    collection do
      match 'search' => 'rooms#search', via: [:get, :post], as: :search
    end
  end
  resources :reservations



end
