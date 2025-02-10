Rails.application.routes.draw do
  devise_for :users

  # Redirect root to Dashboard after login
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  root 'welcome#index'

  # Dashboard
  get 'dashboard', to: 'dashboard#index'

  # Projects
  resources :projects do
    resources :comments, only: [:create, :destroy]
  end

  # Other routes
end