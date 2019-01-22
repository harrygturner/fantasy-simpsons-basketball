Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new', as: 'login_path'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :matches
  resources :users, only: %i[index new show create destroy]
  resources :teams
  resources :players
  resources :team_players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
