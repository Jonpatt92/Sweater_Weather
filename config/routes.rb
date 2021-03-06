Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/forecast',    to: 'forecast#show'
      post '/users',      to: 'user#create'
      post '/sessions',   to: 'user#show'
      post '/road_trip',  to: 'trip#create'
      get '/backgrounds', to: 'image#show'
    end
  end
end
