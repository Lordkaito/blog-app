Rails.application.routes.draw do
  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show]
  # end

<<<<<<< Updated upstream
  get '/', to: 'users#index'
  get 'users/:id', to: 'users#show'
  get 'users/:id/posts', to: 'posts#index'
  get 'users/:id/posts/:id', to: 'posts#show'

  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
=======
  # get '/users', to: 'users#index'
  # get 'users/:id' => 'users#show'
  # get 'users/:id/posts', to: 'posts#index'
  # get 'users/:id/posts/new', to: 'posts#new', as: 'new_post'
  # get 'users/:id/posts/:id', to: 'posts#show'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show]
  end

  root to: 'users#index'
>>>>>>> Stashed changes
end
