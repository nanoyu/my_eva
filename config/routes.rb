Rails.application.routes.draw do

  authenticated :user do
    root "posts#index"
  end
    root 'root#top'

  get 'categories/show'
  get 'uploads/create'
  get 'uploads/destroy'
  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    passwords: "admins/paswwords",
    registrations: "admins/registrations"
  }
  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :posts, only: [:index, :new, :show, :edit, :create, :update, :destroy] do
   resources :comments, only: [:create]
   resources :likes, only: [:create, :destroy]
 end
 resources :uploads, only: [:create, :destroy]
 resources :categories, only: [:show]

 namespace :admins do
  resources :users, only: [:index, :show, :destroy]
  resources :posts, only: [:index, :show, :destroy]
 end

get 'root/top'
get 'root/about'
get 'users/:id/profile_edit' => 'users#profile_edit', as: :profile_edit
get 'users/:id/user_posts' => 'users#user_posts', as: :user_posts
get 'users/:id/user_likes' => 'users#user_likes', as: :user_likes
get 'posts/:id/post_comments' => 'posts#post_comments', as: :all_comment
get '/tag_search/:tag_name' => 'posts#tag_search', as: :tag_search
get 'posts/:id/like_users' => 'posts#like_users', as: :like_user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
