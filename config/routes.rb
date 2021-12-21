Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets do
    resources :t_comments, only: [:create]
  end
  resources :profiles, only: [:index, :new, :create, :edit, :update]
  resources :blogs
  resources :rooms do
    resources :messages, only: [:index, :create]
  end
end
