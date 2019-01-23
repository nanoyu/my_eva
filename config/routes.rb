Rails.application.routes.draw do
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
  resources :users, only: [:show, :edit, :update, :destroy]
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

get 'users/:id/user_posts' => 'users#user_posts', as: :user_posts
get 'posts/:id/post_comments' => 'posts#post_comments', as: :all_comment

root :to => 'root#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
