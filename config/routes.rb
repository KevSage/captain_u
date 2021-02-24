Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :tournaments, :teams, :players, :entries, :assessments, only:[:index, :show, :create]
      get '/teams/:id/players', to: 'teams#get_players'
      get '/players/:player_id/assessments', to: 'assessments#player_assessments'
      get '/teams/:team_id/players/:player_id', to: 'players#playerInfo'
      get '/tournaments/:tournament_id/teams', to: 'tournaments#get_teams'
      get '/tournaments/:tournament_id/teams/:team_id', to: 'teams#show'
      get '/tournaments/:tournament_id/teams/:team_id/players', to: 'teams#get_players'
      get '/tournaments/:tournament_id/teams/:team_id/players/:player_id', to: 'players#playerInfo'
      get '/tournaments/:tournament_id/teams/:team_id/players/:player_id/assessments', to: 'assessments#player_assessments'
    end
  end
end
