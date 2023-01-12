Rails.application.routes.draw do
  get 'about/index'  
  get 'welcomes/index'
  get 'contactus', to: 'welcomes#contactus'
  get 'signup', to: 'users#new' 
  resources :users, except: [:new] 
  resources :articles #, only: [:index, :show, :new, :create, :edit, :update, :delete]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "welcomes#index"
   get 'login', to: 'session#login'
   post 'login', to: 'session#authenticate'
   get 'logout', to: 'session#logout'
   resources :categories
end
