Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'identity/omniauth_callbacks' }
    as :user do
      delete '/sign_out', to: 'devise/sessions#destroy'
    end

  root 'groups#index'

  resources :groups do
    member do
      post :join
      post :quit
    end
    resources :posts do
      resources :messages, only: :create
    end
  end

  namespace :account do
    resources :groups
    resources :posts
  end
end
