Rails.application.routes.draw do
  root "reviews#index"
  resources :reviews, only: [:index, :new, :create]
  resources :users do
    resources :reviews, only: [:index]
  end
  resources :restaurants, only: [:index, :show] do
    resources :reviews, only: [:new]
  end

  get "/login", to: "session#new", as: "login"
  post "/login", to: "session#create"
  get "/logout", to: "session#logout", as: "logout"
  get "/auth/github/callback", to: "session#github"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
