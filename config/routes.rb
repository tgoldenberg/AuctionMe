Rails.application.routes.draw do
  root 'listings#index'
  resources :listings do
    resources :bids
  end
  resources :users, except: [:index]

  post 'sessions/login' => "sessions#login", as: 'login'
  delete 'sessions/logout' => "sessions#logout", as: 'logout'

end
