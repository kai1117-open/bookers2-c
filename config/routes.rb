Rails.application.routes.draw do
  root "homes#top"
 get "home/about"=>"homes#about"

 devise_for :users
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resources :book_comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy] # ここを追加
  end
  resources :users, only: [:index,:show,:edit,:update]  do
    resource :relationships, only: [:create, :destroy]
  	get "followings" => "relationships#followings", as: "followings"
  	get "followers" => "relationships#followers", as: "followers"
  end
  
  
  
  resource :favorite, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
