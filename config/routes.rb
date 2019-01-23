Rails.application.routes.draw do
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/addplayer", to: "players#addplayer"
  get "/selectplayers", to: "players#selectplayers", as: "selectplayers"
  post "/removeplayer", to: "players#removeplayer"
  get "/", to: "sessions#new", as: "root"
  post "/game", to: "matches#create"
  get "/play", to: "matches#show"
  resources :matches
  resources :users
  resources :teams
  resources :players
  resources :team_players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
