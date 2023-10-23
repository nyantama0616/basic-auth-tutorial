Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "ping", to: "pings#index"
  post "signup", to: "users#create"
  get "users/:id", to: "users#show"
  get "users", to: "users#index"
  patch "users/:id", to: "users#update"
  post "close", to: "users#destroy"
end
