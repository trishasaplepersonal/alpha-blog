Rails.application.routes.draw do
  get 'about/index'  
  get 'welcomes/index'
  get 'contactus', to: 'welcomes#contactus'
  resources :articles #, only: [:index, :show, :new, :create, :edit, :update, :delete]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "welcomes#index"
end
