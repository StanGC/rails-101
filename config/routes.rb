Rails.application.routes.draw do
  root 'groups#index'

  devise_for :user
  resources :groups do
    resources :posts
  end
end
