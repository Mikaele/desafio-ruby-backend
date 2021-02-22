Rails.application.routes.draw do
  root 'archives#index'
  resources :archives
  
  resources :store, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
