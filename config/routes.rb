Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets do
    resources :t_comments, only: [:new, :create]
    collection do
      get 'search'
    end
    member do
      get 'mine'
    end
  end
  resources :profiles, only: [:index, :new, :create, :edit, :update]
  resources :blogs do
    resources :b_comments, only: [:new, :create]
    member do
      get 'mine'
    end
  end
  resources :rooms do
    resources :messages, only: [:index, :create]
  end
  resources :users, only: :show do
    resources :relationships, only: [:index, :create, :destroy] do
      collection do
        get 'list'
      end
    end
    collection do
      get 'search'
    end
  end
  resources :likes, only: [:create, :destroy]
end
