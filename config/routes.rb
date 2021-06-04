Rails.application.routes.draw do
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offers, concerns: :paginatable
  resources :jobs, only: [:index, :create, :show] do
    member do
      get :edit
      patch :update
    end
  end
  get '/my_offers', to: 'pages#my_offers', as: 'my_offers'
  get '/my_profiles', to: 'pages#my_profiles', as: 'my_profiles'
  get '/all_users', to: 'pages#all_users', as: 'all_users', concerns: :paginatable
  get '/all_users/:id', to: 'pages#show_user', as: 'show_user'


end
