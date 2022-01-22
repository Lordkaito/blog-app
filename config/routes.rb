Rails.application.routes.draw do
  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show]
  # end

  # get '/users', to: 'users#index'
  # get 'users/:id' => 'users#show'
  # get 'users/:id/posts', to: 'posts#index'
  # get 'users/:id/posts/new', to: 'posts#new', as: 'new_post'
  # get 'users/:id/posts/:id', to: 'posts#show'
  # post 'users/:user_id/posts/:id/create_like', to: 'likes#create', as: 'like_comment'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  root to: 'users#index'
end
