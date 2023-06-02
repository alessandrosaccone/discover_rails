Rails.application.routes.draw do
  resources :bacheca_guidas
  resources :messages
  post '/messages/create_audio', to: 'messages#create_audio', as: 'create_audio'

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
  resources :posts do
    resources :comments, only: [:create]
  end

  get "/translate_html", to: "posts#translate_html"

  resources :roles
  resources :bookings

  #post
  post 'bacheca_guidas/index_for_post', to: 'bacheca_guidas#index_for_post', as: 'index_for_post'
  #delete
  delete 'posts/', to: 'posts#destroy_post', as: 'posts_destroy_for_user'
  #username
  patch 'username/edit', to: 'username#edit', as: 'edit_username'
  patch 'username', to: 'username#update_username', as: 'update_username'

  #bacheca_guida
  get 'bacheca_guidas/show', to: 'bacheca_guidas#show', as: 'show_bacheca'
  get 'bacheca_guidas/edit/:id', to: 'bacheca_guidas#edit', as: 'edit_bacheca'

  # cancella account
  delete '/bacheca_guidas/destroy', to: 'bacheca_guidas#destroy', as: 'destroy_bacheca_guida'

  #bacheca_utenti
  get 'bacheca_utentis/show', to: 'bacheca_utentis#show', as: 'show_bacheca_utenti'
  #get 'bacheca_utentis/edit/:id', to: 'bacheca_utentis#edit', as: 'edit_bacheca_utenti'

  #bacheca_utenti_post
  post 'bacheca_utentis/index_for_post', to: 'bacheca_utentis#index_for_post', as: 'index_for_booking'

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
  post '/conversations/delete_for_recipient/', to: 'conversations#delete_for_recipient', as: 'delete_for_recipient'
  post '/conversations/send_voice_message/', to: 'conversations#send_voice_message', as: 'send_voice_message'
  post '/conversations/delete_for_both/', to: 'conversations#delete_for_both', as: 'delete_for_both'
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
