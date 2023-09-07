Rails.application.routes.draw do
  get 'health/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create, :destroy]
    end
  end

  root 'users#index'

end
