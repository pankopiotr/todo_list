Rails.application.routes.draw do
  root 'todolists#new'

  resources :todolists, only: %w[new create index destroy] do
    resources :tasks, only: %w[new create]
  end
  get 'todolists/:todolist_id', to: 'tasks#index'
end