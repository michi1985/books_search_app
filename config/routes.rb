Rails.application.routes.draw do

  devise_for :users, :controllers => {
    # :sessions      => "registrations",
    :registrations => 'users/registrations'
  }
  resources :users, only: [:show]

  root 'pages#home'

end
