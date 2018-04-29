Rails.application.routes.draw do

  devise_for :users
  root to: "application#index"
  resources :businesses
  resources :tags
  resources :products
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
