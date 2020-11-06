Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users

  resources :users, only: [:show,:index,:edit,:update]
  resource :relationship,  only: [:create, :destroy]

  get 'home/about' => 'homes#about', as: 'about'



   resources :books do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
end