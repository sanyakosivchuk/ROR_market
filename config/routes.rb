# frozen_string_literal: true

Rails.application.routes.draw do
  get 'search', to: "search#index"
  resources :categories
  devise_for :users

  root to: 'products#index'

  resources :products do
    member do
      delete "remove_image/:image_id", to: "products#remove_image", as: :remove_image
    end
  end
end
