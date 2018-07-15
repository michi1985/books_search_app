Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :users, only: [:show]

  root 'pages#home'
  get    '/login',     to: 'pages#login'
  get    '/mypage',    to: 'pages#mypage'

end
