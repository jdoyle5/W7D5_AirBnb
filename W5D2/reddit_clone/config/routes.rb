Rails.application.routes.draw do
  resources :users
  resources :subs
  resources :posts
  resource :session
end
