Rails.application.routes.draw do
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  get '/logout', to: 'session#logout'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'input#index'
  get 'output' => 'output#output'

  get 'usersbd' => 'output#users'
end
