Rails.application.routes.draw do
<<<<<<< HEAD
  resources :messages
  resources :posts do 
    collection do
      get 'all', to: 'posts#all'
    end
  end
=======
  resources :roles
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
>>>>>>> a4a836a613c8db8474711cd329815abab556f9ba

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
  resources :bacheca_guidas

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
  post '/conversations/delete_for_me/', to: 'conversations#delete_for_me', as: 'delete_for_me'
  post '/conversations/send_voice_message/', to: 'conversations#send_voice_message', as: 'send_voice_message'
  post '/conversations/delete_for_both/', to: 'conversations#delete_for_both', as: 'delete_for_both'
  post '/bookings/new', to: 'bookings#new', as: 'create_booking'
  root "pages#home"
  get '/guides', to: 'pages#guides'
<<<<<<< HEAD
  post '/guides', to: 'pages#guides'
=======
>>>>>>> a4a836a613c8db8474711cd329815abab556f9ba
  resources :pages do
    collection do
      get :home
    end
  end

<<<<<<< HEAD
  post 'switch_language' => 'application#switch_language', as: 'switch_language'
=======
  
>>>>>>> a4a836a613c8db8474711cd329815abab556f9ba

end
