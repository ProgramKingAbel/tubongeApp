Rails.application.routes.draw do
  get 'health/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
    get 'show_all', on: :member
  end

  root 'users#index'

end
