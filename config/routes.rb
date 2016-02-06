Rails.application.routes.draw do
  resources :posts
  resources :projects
  get 'home/index'
  root 'home#index'
end
