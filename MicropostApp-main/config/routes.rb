Rails.application.routes.draw do
  resources :categories
  resources :users
  get 'menu_pages/home'
  get 'menu_pages/help'
  resources :microposts

  resources :following
  resources :followers
  resources :relationships

  # Lets the server know how to handle a call to the follower and following.
  resources :users do
    member do
      get :following, :followers
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
