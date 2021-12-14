Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets do
    resources :profiles, only: [:index, :new, :create]
  end
end
