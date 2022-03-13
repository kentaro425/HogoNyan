Rails.application.routes.draw do
    # 顧客用
  # URL /customers/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    resources :users, only: [:edit, :update] do
      member do
        get 'home', to: 'users#show'
        get 'requester_home', to: 'users#requester_show'
        get 'sns_home', to: 'users#sns_show'
        get 'requester_edit'
        get 'sns_edit'
        get 'unsubscribe'
        patch 'withdraw'
        get 'favorites'
        get 'sns_favorites'
      end

      collection do
        get 'search'
      end

      resources :relationships, only: [:create, :destroy] do
        collection do
          get 'followings'
          get 'followers'
        end
      end

      resources :notifications, only: [:index, :destroy] do
        collection do
          delete "destroy_all"
        end
      end
    end

    resources :requests do
      collection do
        get 'search'
      end
      resources :favorites, only: [:create, :destroy]
    end

    resources :chats, only: [:show, :create]

    get 'rooms/index'
    root 'homes#top'
    get 'homes/about', as: 'about'

    resources :posts do
      collection do
        get 'search'
      end
      resources :favorites, only: [:create, :destroy]
      resources :comments, only: [:create]
    end
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :notifications, only: [:index, :destroy] do
      collection do
        delete "destroy_all"
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end