Rails.application.routes.draw do
  resource :post, only: [:create]
  resources :top_rating_posts, only: [:index]
  resources :ratings, only: [:create]
end
