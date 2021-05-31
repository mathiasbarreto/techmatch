Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :offers, only: [:new, :create]
    resources :jobs, only: [:new, :create]
  end
  resources :offers, except: [:new, :create]
  resources :jobs, only: [:index]
end
