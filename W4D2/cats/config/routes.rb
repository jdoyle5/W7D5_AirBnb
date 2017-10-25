Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats

  # get 'cats', to: 'cats#index'
  # post 'cats', to: 'cats#create'
  # get 'cats/new', to: 'cats#new'
  # get 'cats/:id/edit', to: 'cats#edit'
  # get 'cats/:id', to: 'cats#show'
  # patch 'cats/:id', to: 'cats#update'
  # put 'cats/:id', to: 'cats#update'
  # delete 'cats/:id', to: 'cats#destroy'

end
