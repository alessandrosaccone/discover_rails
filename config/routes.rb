Rails.application.routes.draw do
  resources :roles
  devise_for :users 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"

  resources :pages do
    collection do
      get :home
    end
  end

  

end
