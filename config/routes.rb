Rails.application.routes.draw do
  root to: "posts#index"

  namespace :emojis do
    resources :mentions, only: [:index]
  end

  namespace :saved_replies do
    resources :mentions, only: [:index]
  end

  namespace :articles do
    resources :mentions, only: [:index]
  end

  resources :articles
  resources :posts
  resources :saved_replies
end
