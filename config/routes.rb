Rails.application.routes.draw do
  get 'group_memberships/create'
  get 'group_memberships/destroy'
  get 'ratings/create'
  root "homes#top"
 get "home/about"=>"homes#about"
get "/search", to: "searches#search"

 devise_for :users
 
resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  resources :ratings
  get 'tags/:tag', to: 'books#tag', as: :tag, on: :collection
end

  resources :users, only: [:index,:show,:edit,:update]  do
    resource :relationships, only: [:create, :destroy]
  	get "followings" => "relationships#followings", as: "followings"
  	get "followers" => "relationships#followers", as: "followers"
  end
  
  resources :users do
  member do
    get 'check_daily_books'
  end
  end
  
  resources :groups do
    resources :events, only: [:new, :create, :index] # 必要に応じて他のアクションも追加
end

  resources :group_memberships
  resources :chats, only: [:show, :create, :destroy]
  
  resource :favorite, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
