Rails.application.routes.draw do
  resources :archives
  resources :archives do
    root to: "archives#index"
    resources :file_uploads, only: [:new, :create]
  end
  get 'transaction/index'
  post 'transaction/upload'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
