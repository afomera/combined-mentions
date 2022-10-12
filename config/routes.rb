Rails.application.routes.draw do
  resources :articles
  resources :posts
  root to: "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :emojis do
    resources :mentions, only: [:index]
  end

  namespace :saved_replies do
    resources :mentions, only: [:index]
  end

  resources :saved_replies
end
