Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"
  resources :items
  resources :user, only: [:show] do
    resources :locations
  end
end
