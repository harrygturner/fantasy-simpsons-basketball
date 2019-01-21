Rails.application.routes.draw do
  resources :matches
  resources :users, only: %i[index new show create destroy]
  resources :teams
  resources :players
  resources :team_players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
