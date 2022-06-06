Rails.application.routes.draw do
    post "/signup", to: "users#create"
    post "/login", to: "sessions#create"
    namespace :api, defaults: {format: 'json'} do
        namespace :v1 do
          resources :cars
        end
    end
end
