Rails.application.routes.draw do
  resources :transactions, only: :create
  resources :users, only: [:show, :create, :update]

  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  # get "/user_is_authed", to: "auth#user_is_authed"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
