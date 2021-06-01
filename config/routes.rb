Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :jobs, only: [:create]
  end
  resources :offers
  resources :jobs, only: [:index, :show]
  resources :my_offers, only: [:index]
  resources :my_jobs, only: [:index]
  resource :my_profiles, only: [:show]
end
