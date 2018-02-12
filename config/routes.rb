Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_scope :user do
    authenticated :user do
      root to: 'todolists#new', as: :authenticated_root
    end
  
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :todolists, only: %w[new create index destroy] do
    resources :tasks, only: %w[new create]
  end
  get 'todolists/:todolist_id', to: 'tasks#index'
end