Rails.application.routes.draw do

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
     resources :posts, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
