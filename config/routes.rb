Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets do
    resources :t_comments, only: [:new, :create]
  end
  resources :profiles, only: [:index, :new, :create, :edit, :update]
  resources :blogs do
    resources :b_comments, only: [:new, :create]
  end
  resources :rooms do
    resources :messages, only: [:index, :create]
  end
  resources :users, only: :show do
    resources :relationships, only: [:index, :create, :destroy]
  end
end
