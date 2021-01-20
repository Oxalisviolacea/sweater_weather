Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#show'
      get '/backgrounds', to: 'backgrounds#show'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#show'
      post '/road_trip', to: 'road_trips#show'
      get '/munchies', to: 'business_destinations#show'
    end
  end
end
