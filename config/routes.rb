Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'dashboard#index', as: :authenticated_root

  # Dashboard
  get 'dashboard', to: 'dashboard#index'

  # Projects with nested comments
  resources :projects do
    resources :comments, only: [:create, :destroy]
  end
end
