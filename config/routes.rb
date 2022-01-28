Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [:index, :create] do
        resources :comments, only: [:index, :create]
      end
    end
  end

  devise_for :users
  devise_scope :user do get '/users/sign_out' => 'devise/sessions#destroy' end
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
  root "users#index"
end
