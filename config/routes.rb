Rails.application.routes.draw do
  resources :messages
  resources :posts do 
    collection do
      get 'all', to: 'posts#all'
    end
  end

 get 'conversations/show', to: 'conversations#show', as: 'conversation'
  resources :conversations do
    end
  
  resources :posts do 
    member do
      get 'get_price'
    end
  end
  resources :posts

  get "/translate_html", to: "posts#translate_html"

  resources :roles
  resources :bookings

  get '/send_email', to: 'email#send_email', as: 'send_email'


  resources :guide_users do
    get 'update_location', on: :collection
  end
  resources :bookings do
    member do
      post 'refund'
    end
    member do
      get 'download_invoice'
    end
  end


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

  post 'switch_language' => 'application#switch_language', as: 'switch_language'

end
