Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'posts#index'

  get '/users/:user_id/blog', to: 'diaries#show', as: :blog

  resources :diaries, except: %i[show new edit index] do
    resources :posts, only: %i[create destroy update]
  end
end
