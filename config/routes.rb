Rails.application.routes.draw do
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  resources :users do
    get :change_permission, on: :member
  end
  resources :sessions
  get 'users/new'

  resources :posts do
    get :favourite, on: :member
    resources :comments
  end

  root "posts#index"

  get '/about', to: 'pages#about'
  
end