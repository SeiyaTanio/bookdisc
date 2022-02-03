Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
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
  resources :profiles, only: [:new, :create, :edit, :update]
  resources :blogs do
    resources :b_comments, only: [:new, :create]
    member do
      get 'mine'
    end
  end
  resources :rooms, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :messages, only: [:index, :create, :destroy]
  end
  resources :users, only: [:show, :destroy] do
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
