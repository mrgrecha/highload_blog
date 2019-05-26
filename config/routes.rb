# frozen_string_literal: true

Rails.application.routes.draw do
  resource :post, only: [:create]
  resources :top_rating_posts, only: [:index]
  resources :ratings, only: [:create]
  resources :not_unique_ip_addresses, only: [:index]
end
