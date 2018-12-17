Rails.application.routes.draw do
  root "reviews#index"
  resources :reviews
  resources :users do
    resources :restaurants, only: [:show]
  end
  resources :restaurants do
    resources :reviews, only: [:show, :new]
  end

  get "/login", to: "session#login", as: "login"
  get "/logout", to: "session#logout", as: "logout"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
