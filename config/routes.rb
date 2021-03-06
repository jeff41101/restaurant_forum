Rails.application.routes.draw do
  devise_for :users

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    #瀏覽所有餐廳的最新動態
    collection do
      get :feeds
      get :ranking
    end
  
    #瀏覽個別餐廳的 Dashboard
    member do
      get :dashboard
      post :favorite
      post :unfavorite
      post :like
      post :unlike
    end  

  end
  resources :categories, only: :show
  resources :followships, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]

  resources :users, only: [:index, :edit, :show, :update] do
    member do
      get :friend_list
    end
  end
  root "restaurants#index" 

  namespace :admin do
    resources :restaurants
    resources :categories   
    root "restaurants#index"
  end

end