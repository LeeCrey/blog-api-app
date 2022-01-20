Rails.application.routes.draw do
  root 'authentication#create'

  post 'register' => 'registration#create'
  post 'login' => 'authentication#create'
  delete 'users' => 'registration#destroy'

  resources :posts do
    resources :comments, shallow: true
  end
end
