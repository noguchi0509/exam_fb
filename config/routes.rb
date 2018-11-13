Rails.application.routes.draw do
  get 'sessions/new'

    root to: 'posts#index'
    resources :posts do
      collection do
          post :confirm
      end
      member do
        patch :edit_confirm
      end
    end
    
    resources :sessions, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create, :show]
end