Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "jobs", to: "jobs#index"
  get "/jobs/:id/new", to: "jobs#new"
  post "jobs", to: "jobs#create"
end
