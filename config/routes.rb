Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'posts#index'

  get '/users/:id/blog', to: 'diaries#show', as: :blog

  post '/users/:id/subscribe', to: 'subscriptions#change_subscription_status', as: :subscription
  get 'subscriptions/posts', to: 'posts#subscription_index', as: :subscriptions_posts

  post '/posts/:id/like', to: 'posts#like', as: :like_post
  post '/posts/:id/dislike', to: 'posts#dislike', as: :dislike_post

  resources :diaries, except: %i[show new edit index] do
    resources :posts, only: %i[create destroy update]
  end
end
