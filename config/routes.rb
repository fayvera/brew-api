Rails.application.routes.draw do


  namespace :api do 
    resources :locations, only: [:index, :show]
    resources :likes 
    resources :breweries, only: [:index, :show]
    resources :users, except: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
