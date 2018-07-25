Rails.application.routes.draw do

  devise_for :users, :controllers => {
    # :sessions      => "registrations",
    :registrations => 'users/registrations'
  }
  resources :users, only: [:show]

  root 'pages#home'
  get  '/home_book_list',  to: 'pages#home_book_list'

end
