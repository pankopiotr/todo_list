Rails.application.routes.draw do
  root 'todolists#new'
  resources :todolists, only: %w[new create]
end
