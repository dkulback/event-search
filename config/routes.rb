Rails.application.routes.draw do
  root 'users#new'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'
  resources :users, only: %i[show new create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
