Rails.application.routes.draw do


  namespace :api do 
    resources :locations
    resources :likes
    resources :breweries
    resources :users, except: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
