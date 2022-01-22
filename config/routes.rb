Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'login#login_form'
  post '/login', to: 'login#login'

  resources :users, only: %i[show new create] do
    resources :stocks, only: :index, controller: :user_stocks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
