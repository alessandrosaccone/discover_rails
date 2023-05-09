Rails.application.routes.draw do
  resources :roles
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 
  root "pages#home"
  get '/guides', to: 'pages#guides'
  resources :pages do
    collection do
      get :home
    end
  end

  

end
