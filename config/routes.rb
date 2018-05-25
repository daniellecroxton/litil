Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :businesses do
    collection do
      get 'search'
    end
    resources :products
  end
  resources :tags
  resources :categories, only: [:index, :show]
  resources :users, only: [:show]
  root to: 'businesses#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
