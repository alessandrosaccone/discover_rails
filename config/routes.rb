Rails.application.routes.draw do
 
  resources :bacheca_utentes
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
    resources :ratings, only: [:create, :update, :destroy]
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
  get 'bacheca_guidas/show_for_others', to: 'bacheca_guidas#show_for_others', as: 'show_bacheca_for_others'

  # cancella account
  delete '/bacheca_guidas/destroy', to: 'bacheca_guidas#destroy', as: 'destroy_bacheca_guida'

  #città
  get 'bacheca_guidas/show_city', to: 'bacheca_guidas#show_city'

  #bacheca_utenti
  get 'bacheca_utentes/show', to: 'bacheca_utentes#show', as: 'show_bacheca_utenti'
  #get 'bacheca_utentes/edit/:id', to: 'bacheca_utentes#edit', as: 'edit_bacheca_utenti'

  #bacheca_utenti_post
  post 'bacheca_utentes/index_for_post', to: 'bacheca_utentes#index_for_post', as: 'index_for_booking'

  #cambia immagine
  devise_scope :user do
    patch 'users/cambia_img', to: 'users/registrations#cambia_img', as:'immagine'
  end

  #descrizione utenti
  get 'bacheca_utentes/edit/:id', to: 'bacheca_utentes#edit', as: 'edit_bacheca_utentis'

  #lang
  patch 'username/update_lang', to: 'username#update_lang', as: 'update_lang'

  #city e country
  patch 'username/update_city', to: 'username#update_city', as: 'update_city'

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
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
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
