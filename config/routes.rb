Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:show]
  resources :bikes do
    resources :maintenances
    resources :schedules, only: [:show, :new, :create]
  end

end
