Rails.application.routes.draw do
  
  devise_for :users

  root to: "home#index"

  resources :products do
    member do
      delete :remove_image
    end
  end
end
