Rails.application.routes.draw do
  # api.mywebsite.com/v1/users/
  # api.mywebsite.com/login/
  # API
  namespace :api, constraints: { subdomain: 'api' }, path: '/' do
    # JWT
    post 'login', to: 'sessions#create'

    namespace :v1 do
      resources :users
    end
  end
end
