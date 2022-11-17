Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'posts#index'

  get '/users/:id/blog', to: 'diaries#show', as: :blog

  resources :diaries, except: :show

  resources :posts, only: %i[create destroy update]
end
