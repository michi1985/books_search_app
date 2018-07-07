Rails.application.routes.draw do
  root 'pages#home'
  get    '/login',     to: 'pages#login'
  get    '/signup',    to: 'pages#signup'
  get    '/mypage',    to: 'pages#mypage'
end
