Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'login#login_form'
  post '/login', to: 'login#login'
  delete 'logout', to: 'sessions#destory'
  resources :users, only: %i[show new create] do
    resources :stocks, only: :index, controller: :user_stocks
    resources :crimes, only: :index, controller: :user_uk_crimes
    resources :bible_verses, only: :index, controller: :user_bible_verses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/google_oauth2/callback', to: 'sessions#create'
end
