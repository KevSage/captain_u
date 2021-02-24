Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :tournaments, :teams, :players, only:[:index, :show]
      get '/teams/:id/players', to: 'teams#get_players'
      get '/teams/:team_id/players/:player_id', to: 'players#playerInfo'
    end
  end
end
