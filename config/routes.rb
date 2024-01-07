# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'products#index'

  resources :products do
    member do
      delete :remove_image
    end
  end
end
