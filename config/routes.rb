Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users


  resources :users do
    resource :relationship,  only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  get 'home/about' => 'homes#about', as: 'about'



   resources :books do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
end