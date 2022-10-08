Rails.application.routes.draw do
  get 'about/index'  
  get 'welcomes/index'
  get 'contactus', to: 'welcomes#contactus'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "welcomes#index"
end
