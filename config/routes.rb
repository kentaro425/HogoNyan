Rails.application.routes.draw do
  namespace :public do
    get 'notifications/index'
  end
  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  namespace :public do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
    get 'posts/search'
  end
  namespace :public do
    get 'rooms/index'
  end
  namespace :public do
    get 'chats/show'
  end
  namespace :public do
    get 'requests/new'
    get 'requests/index'
    get 'requests/show'
    get 'requests/edit'
    get 'requests/search'
  end
  namespace :public do
    get 'users/show'
    get 'users/requester_show'
    get 'users/sns_show'
    get 'users/edit'
    get 'users/requester_edit'
    get 'users/sns_edit'
    get 'users/unsubscribe'
    get 'users/search'
    get 'users/favorites'
    get 'users/sns_favorites'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'notifications/index'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
  end
  # devise_for :admins
  # devise_for :users
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
