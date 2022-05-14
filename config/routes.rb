Rails.application.routes.draw do
  resources :chats, only: %i[index show]
  root 'pages#home'
  get 'clicker', to: 'pages#clicker'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
