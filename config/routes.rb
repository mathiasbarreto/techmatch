Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offers
  resources :jobs, only: [:index, :create, :show] do
    member do
      get :edit
      patch :update
    end
  end
  get '/my_offers', to: 'pages#my_offers', as: 'my_offers'
  get '/my_jobs', to: 'pages#my_jobs', as: 'my_jobs'
  get '/my_profiles', to: 'pages#my_profiles', as: 'my_profiles'
  get '/all_users', to: 'pages#all_users', as: 'all_users'
  get '/all_users/:id', to: 'pages#show_user', as: 'show_user'
end
