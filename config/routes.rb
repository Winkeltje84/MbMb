Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:show]
  resources :bikes do
    resources :maintenances
  end

  resources :maintenances, only: [:new, :create]
end
