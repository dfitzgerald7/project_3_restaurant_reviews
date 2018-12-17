Rails.application.routes.draw do
  root "static#welcome"
  resources :reviews
  resources :users
  resources :restaurants do
    resources :reviews, only: [:show, :new]
  end

  get "/login", as: "session#login"
  get "/logout", as: "session#logout"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
