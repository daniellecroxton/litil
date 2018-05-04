Rails.application.routes.draw do

  devise_for :users
  root to: "application#index"
  resources :businesses do
    resources :products
  end
  resources :tags
  resources :categories, only: [:index, :show]
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
