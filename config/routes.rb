Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"
  get "/contact_us", to: 'pages#contact_us'
  resources :items do
    resources :item_photos
  end
  resources :user, only: [:show] do
    resources :locations
  end
end
