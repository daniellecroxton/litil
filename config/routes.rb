Rails.application.routes.draw do
  resources :businesses
  resources :tags
  resources :products
  resources :categories
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
