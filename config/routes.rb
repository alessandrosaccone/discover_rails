Rails.application.routes.draw do
  resources :posts
  resources :roles
  resources :bookings
  devise_for :users, :controllers => 
  { :omniauth_callbacks => "users/omniauth_callbacks",
    sessions: 'users/sessions',
    registrations: 'users/registrations'
   }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  post '/bookings/new', to: 'bookings#new', as: 'create_booking'
  root "pages#home"
  get '/guides', to: 'pages#guides'
  post '/guides', to: 'pages#guides'
  resources :pages do
    collection do
      get :home
    end
  end
end
