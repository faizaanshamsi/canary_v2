Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"
  get "/contact_us", to: 'pages#contact_us'
  resources :items do
    member do
      post 'submit_draft'
    end
    resources :item_photos
  end
  resources :users, only: [:show] do
    resources :locations
    resources :items do
    end
  end
end
