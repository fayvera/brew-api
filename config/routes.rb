Rails.application.routes.draw do


  resources :likes
  resources :breweries
  namespace :api do 
    resources :users, except: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
