Rails.application.routes.draw do
  root 'homes#top'
  resources :books
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  get 'home/about' => 'homes#about', as: 'about'
end