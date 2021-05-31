Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs, only: :index, :new, :create
  resources :offers
  resources :users
end
