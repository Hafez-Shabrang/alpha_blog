Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  root "pages#home"

  resources :articles

  resources :users, except: [:new]

  get "signup", to: "users#new"

  get "signin", to: "sessions#new"

  post "signin", to: "sessions#create"

  get "logout", to: "sessions#destroy"

  resources :categories

end
