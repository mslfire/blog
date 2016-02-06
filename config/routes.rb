Rails.application.routes.draw do
  resources :posts
  resources :projects
  resources :contacts, only: [:new, :create]
  get 'home/index'
  root 'home#index'

  get '*path' => redirect('/')  
end
