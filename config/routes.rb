Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'businesses#search'
  resources :businesses do
    collection do
      get 'search'
    end
    resources :products
  end
  resources :tags
  resources :categories, only: [:index, :show]
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
