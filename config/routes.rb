Rails.application.routes.draw do
    devise_for :users,
    controllers: {
      sessions: 'api/v1/sessions',
      registrations: 'api/v1/registrations'
    }
    get 'user-data', to: 'users#show'
end
