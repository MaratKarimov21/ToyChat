Rails.application.routes.draw do
  resources :games, only: %i[create show]
  resources :chats, only: %i[index show] do
    resources :messages, only: %i[new create]
  end

  root 'pages#home'
  get 'clicker', to: 'pages#clicker'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
