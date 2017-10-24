Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :artworks
  resources :shared_works
  # get 'users', to: 'users#index', as: 'user_index'
  # post 'users', to: 'users#create', as: 'create_user'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get 'users/:id', to: 'users#show', as: 'show_user'
  # patch 'users/:id', to: 'users#update', as: 'patch_update_user'
  # put 'users/:id', to: 'users#update', as: 'put_update_user'
  # delete 'users/:id', to: 'users#destroy', as: 'destroy_user'
end
