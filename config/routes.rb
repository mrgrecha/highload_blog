Rails.application.routes.draw do
  resources :posts, only: [:create]
  resources :ratings, only: [:create]
end
