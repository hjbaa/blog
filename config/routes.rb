Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'posts#index'

  get '/users/:id/blog', to: 'diaries#show', as: :blog

  post '/users/:id/subscribe', to: 'subscriptions#change_subscription_status', as: :subscription
  get 'subscriptions/posts', to: 'posts#subscription_index', as: :subscriptions_posts

  resources :diaries, except: %i[show new edit index] do
    resources :posts, only: %i[create destroy update]
  end
end
