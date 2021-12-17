Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets
  resources :profiles, only: [:index, :new, :create, :edit, :update]
  resources :blogs, only: :index
end
